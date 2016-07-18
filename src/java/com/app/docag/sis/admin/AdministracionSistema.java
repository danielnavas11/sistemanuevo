package com.app.docag.sis.admin;

import com.app.bootstrap.util.IVDAjaxPagingNavigator;
import com.sis.persistencia.dao.pojos.Idioma;
import com.sis.persistencia.h.IdiomaH;
import java.util.ArrayList;
import java.util.List;
import org.apache.wicket.Component;
import org.apache.wicket.ajax.AbstractDefaultAjaxBehavior;
import org.apache.wicket.ajax.AjaxEventBehavior;
import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.markup.html.AjaxLink;
import org.apache.wicket.ajax.markup.html.form.AjaxButton;
import org.apache.wicket.behavior.AbstractAjaxBehavior;
import org.apache.wicket.event.IEvent;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.form.Button;
import org.apache.wicket.markup.html.link.Link;
import org.apache.wicket.markup.html.panel.Panel;
import org.apache.wicket.markup.repeater.Item;
import org.apache.wicket.markup.repeater.RepeatingView;
import org.apache.wicket.markup.repeater.data.DataView;
import org.apache.wicket.markup.repeater.data.ListDataProvider;
import org.apache.wicket.model.Model;
import org.apache.wicket.spring.injection.annot.SpringBean;

/**
 * @author daniel
 */
public class AdministracionSistema extends Panel {
    private List<Idioma> listaIdiomas = new ArrayList<Idioma>();
    @SpringBean
    private IdiomaH idiomaImpl;
    
    public AdministracionSistema(String id){
        super(id);
        listaIdiomas=idiomaImpl.getAllIdiomas();
        System.out.println("listaIdiomas:"+listaIdiomas);
        ListDataProvider<Idioma> listDataProviderIdiomas = new ListDataProvider<Idioma>(listaIdiomas);
        DataView<Idioma> dataView = new DataView<Idioma>("rowsIdiomas", listDataProviderIdiomas) {
            @Override
            protected void populateItem(final Item<Idioma> item) {
                final Idioma idi = item.getModelObject();
                item.add(new Label("idioma_idioma", idi.getId_idioma()+""));
                item.add(new Label("idioma_siglas", idi.getSiglas()));
                item.add(new Label("idioma_nombre", idi.getIdioma()));
                Button btn=new Button("dataRowEditar");
                btn.add(new AjaxEventBehavior("onclick") {
                    @Override
                    protected void onEvent(AjaxRequestTarget art) {
                         System.out.println("click "+idi.getId_idioma());
                    }
                    
                });
                item.add(btn);
                /*Button dataRowEditar=new Button("dataRowEditar",new Model(idi.getId_idioma()));
                dataRowEditar.add(new AjaxEventBehavior("onclick") {
                    private static final long serialVersionUID = -7133385027739964990L;
                    @Override
                    protected void onEvent(AjaxRequestTarget target) {
                        System.out.println("click "+idi.getId_idioma());
                    }
                });
                item.add(dataRowEditar);
                /*RepeatingView repeatingView = new RepeatingView("dataRowIdiomas");
                repeatingView.add(new Label(repeatingView.newChildId(), idi.getId_idioma()+""));
                repeatingView.add(new Label(repeatingView.newChildId(), idi.getSiglas()));
                repeatingView.add(new Label(repeatingView.newChildId(), idi.getIdioma()));
                AjaxLink dataRowEditar=new AjaxLink("dataRowEditar",new Model(idi.getId_idioma())) {
                    @Override
                    public void onClick(AjaxRequestTarget art) {
                        System.out.println("Editar"+item.getId());
                    }
                };
                dataRowEditar.add(new Button(repeatingView.newChildId()));
                item.add(dataRowEditar);
                item.add(repeatingView); */
            }
            
        };
        dataView.setItemsPerPage(6);
        add(dataView);
        add(new IVDAjaxPagingNavigator("pagingNavigator", dataView));
        System.out.println("com.app.docag.sis.admin.AdministracionSistema.<init>()");
        
    }  
}
