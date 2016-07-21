package com.app.bootstrap.modal;

import com.app.bootstrap.util.ICssClassNameProvider;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;
import org.apache.wicket.AttributeModifier;
import org.apache.wicket.Component;
import org.apache.wicket.MarkupContainer;
import org.apache.wicket.WicketRuntimeException;
import org.apache.wicket.ajax.AjaxEventBehavior;
import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.markup.ComponentTag;
import org.apache.wicket.markup.head.IHeaderResponse;
import org.apache.wicket.markup.head.OnDomReadyHeaderItem;
import org.apache.wicket.markup.html.TransparentWebMarkupContainer;
import org.apache.wicket.markup.html.WebMarkupContainer;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.list.ListItem;
import org.apache.wicket.markup.html.list.ListView;
import org.apache.wicket.markup.html.panel.GenericPanel;
import org.apache.wicket.markup.html.panel.Panel;
import org.apache.wicket.model.AbstractReadOnlyModel;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.Model;
import org.apache.wicket.util.string.Strings;

/**
 *
 * @author Daniel Navas
 */
public class ModalBootstrap extends GenericPanel {

    final static Logger log_erp = Logger.getLogger(ModalBootstrap.class);
    public static final String BUTTON_MARKUP_ID = "button";
    private final IModel<Boolean> disableEnforceFocus = new Model<Boolean>(false);
    private Component headerLabel;
    private final List<Component> buttons = new ArrayList<Component>();
    private MarkupContainer footer;
    private MarkupContainer header;
    private AjaxEventBehavior closeBehavior;
    private boolean show = false;
    private String titulo="";

    public enum Size implements ICssClassNameProvider {

        Default(""),
        Small("sm"),
        Medium("md"),
        Large("lg");
        private final String cssClassName;

        Size(final String cssClassName) {
            this.cssClassName = cssClassName;
        }

        @Override
        public String cssClassName() {
            return "modal-" + cssClassName;
        }
    }

    public ModalBootstrap(String id) {
        super(id);
    }

    @Override
    protected void onInitialize() {
        super.onInitialize();
        footer = new WebMarkupContainer("footer");
        header = new WebMarkupContainer("header");
        headerLabel = new Label("header-label", "");
        header.add(headerLabel);
        headerLabel.setOutputMarkupId(true);
        footer.add(new ListView<Component>("buttons", buttons) {
            @Override
            protected void populateItem(ListItem<Component> item) {
                item.add(item.getModelObject());
            }
        });
        
        WebMarkupContainer dialog = createDialog("dialog");    
        dialog.add(header);
        dialog.add(footer);
        add(dialog);
    }

    public ModalBootstrap setFooterVisible(final boolean visible) {
        footer.setVisible(visible);
        return this;
    }

    public ModalBootstrap setHeaderVisible(final boolean visible) {
        if(header==null){
            header = new WebMarkupContainer("header");
        }else{
            header.setVisible(visible);
        }
        return this;
    }

    public ModalBootstrap header(IModel<String> label) {
        if(headerLabel==null){
            headerLabel=new Label("header-label", label);
        }else{
            headerLabel.setDefaultModel(label);
        }
        setHeaderVisible(true);
        return this;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
    
    

    @Override
    protected void onConfigure() {
        super.onConfigure();
        if (Strings.isEmpty(getTitulo())) {
            // there must be at least on character inside the header to prevent
            // layout problems.
            headerLabel.setDefaultModelObject("&nbsp;");
            headerLabel.setEscapeModelStrings(false);
        }else{
            headerLabel.setDefaultModelObject(getTitulo());
        }

        footer.setVisible(buttons.size() > 0);
    }

    protected WebMarkupContainer createDialog(String id) {
        return new TransparentWebMarkupContainer(id) {
            @Override
            protected void onComponentTag(ComponentTag tag) {
                super.onComponentTag(tag);
            }
        };
    }

    @Override
    public void renderHead(IHeaderResponse response) {
        super.renderHead(response);

        response.render(OnDomReadyHeaderItem.forScript(createInitializerScript(getMarkupId(true))));
    }

    private String createInitializerScript(final String markupId) {
        return addCloseHandlerScript(markupId, createBasicInitializerScript(markupId));
    }

    private String addCloseHandlerScript(final String markupId, final String script) {
        if (closeBehavior != null) {
            return script + ";$('#" + markupId + "').on('hidden', function () { "
                    + "  Wicket.Ajax.ajax({'u':'" + closeBehavior.getCallbackUrl() + "','c':'" + markupId + "'});"
                    + "})";
        }

        return script;
    }

    protected final String showImmediately() {
        if(show)
            return "show";
        else
            return "hide";
    }

    protected String createBasicInitializerScript(final String markupId) {
        return "$('#" + markupId + "').modal('" + showImmediately() + "')";
    }

    public ModalBootstrap addCloseButton() {
        return addCloseButton(Model.of("Close"));
    }

    public ModalBootstrap setContent(final Panel component) {
        if (!component.getId().equals("content")) {
            throw new WicketRuntimeException("Modal content id is wrong. Component ID:" + component.getId()
                    + "; content ID: " + "content");
        }
        
        component.setOutputMarkupId(true);
        addOrReplace(component);
        return this;
    }
    
    public ModalBootstrap addCloseButton(final IModel<String> label) {
        ModalCloseButton button = new ModalCloseButton(label);
        button.setAnchor(this);
        return addButton(button);
    }

    public ModalBootstrap addButton(final Component button) {
        if (!BUTTON_MARKUP_ID.equals(button.getId())) {
            throw new IllegalArgumentException(
                    String.format("Invalid button markup id. Must be '%s'.", BUTTON_MARKUP_ID));
        }
        button.add(new AttributeModifier("class", new AbstractReadOnlyModel<String>() {
            @Override
            public String getObject () {
                return "btn btn-default waves-effect";
            }
        }));
        buttons.add(button);
        return this;
    }
    public ModalBootstrap appendCloseDialogJavaScript(final AjaxRequestTarget target) {
        target.prependJavaScript(createActionScript(getMarkupId(true), "hide"));
        return this;
    }

    public ModalBootstrap appendShowDialogJavaScript(final AjaxRequestTarget target) {
        target.appendJavaScript(createActionScript(getMarkupId(true), "show"));
        appendDisableEnforceFocus(target);
        return this;
    }

    protected ModalBootstrap appendDisableEnforceFocus(AjaxRequestTarget target) {
        if (disableEnforceFocus.getObject()) {
            target.appendJavaScript("$.fn.modal.Constructor.prototype.enforceFocus = function () {};");
        }
        return this;
    }

    public ModalBootstrap show(boolean show) {
        this.show = show;
        return this;
    }

    public ModalBootstrap show(final AjaxRequestTarget target) {
        return appendShowDialogJavaScript(target);
    }

    protected String createActionScript(final String markupId, final String action) {
        return "$('#" + Strings.escapeMarkup(markupId) + "').modal('" + action + "');";
    }

}
