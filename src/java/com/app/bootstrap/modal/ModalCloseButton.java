package com.app.bootstrap.modal;

import org.apache.wicket.AttributeModifier;
import org.apache.wicket.Component;
import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.attributes.AjaxCallListener;
import org.apache.wicket.ajax.attributes.AjaxRequestAttributes;
import org.apache.wicket.ajax.markup.html.AjaxLink;
import org.apache.wicket.markup.html.form.Button;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.Model;
import org.apache.wicket.util.string.Strings;

/**
 *
 * @author Daniel Navas
 */

public class ModalCloseButton extends AjaxLink<String> {

    private final Button buttonBehavior;

    private ModalBootstrap anchor;

    /**
     * Construct.
     */
    public ModalCloseButton() {
        this(new Model("Close"));
    }

    /**
     * Construct.
     *
     * @param label The button label
     */
    public ModalCloseButton(final IModel<String> label) {
        super("button", label);

        setBody(getDefaultModel());
        buttonBehavior = new Button("button");

        add(new AttributeModifier("data-dismiss", "modal"));
        add(buttonBehavior);
    }

    @Override
    protected void updateAjaxAttributes(AjaxRequestAttributes attributes) {
        super.updateAjaxAttributes(attributes);

        Component _anchor = this.anchor;
        if (_anchor == null) {
            _anchor = findParent(ModalBootstrap.class);
        }
        if (_anchor != null) {
            String anchorMarkupId = _anchor.getMarkupId();
            if (!Strings.isEmpty(anchorMarkupId)) {
                AjaxCallListener listener = new AjaxCallListener();
                listener.onBeforeSend(String.format("document.location.hash='%s';", anchorMarkupId));
                listener.onBeforeSend(String.format("$('#%s').modal('hide');", anchorMarkupId));
                attributes.getAjaxCallListeners().add(listener);
            }
        }
    }

    @Override
    public void onClick(AjaxRequestTarget target) {

    }

    public ModalCloseButton setAnchor(ModalBootstrap anchor) {
        this.anchor = anchor;
        return this;
    }

}