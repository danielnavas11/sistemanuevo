package com.app.docag.sis.home;

import com.app.bootstrap.util.IVDAjaxPagingNavigator;
import com.app.docag.sis.WebSesion;
import com.app.docag.sis.proyectos.ModalAgregarProyectos;
import com.sis.persistencia.dao.pojos.Idioma;
import com.sis.persistencia.h.ProyectoH;
import java.util.ArrayList;
import java.util.List;
import org.apache.wicket.markup.html.WebMarkupContainer;
import org.apache.wicket.markup.html.panel.Panel;
import org.apache.wicket.spring.injection.annot.SpringBean;
import com.sis.persistencia.dao.pojos.Proyecto;
import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.markup.html.AjaxLink;
import org.apache.wicket.authroles.authentication.AuthenticatedWebSession;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.repeater.Item;
import org.apache.wicket.markup.repeater.RepeatingView;
import org.apache.wicket.markup.repeater.data.DataView;
import org.apache.wicket.markup.repeater.data.ListDataProvider;

/**
 * @author Daniel Navas
 */
public class Proyectos extends Panel {
    @SpringBean
    private ProyectoH proyectoImpl;
    
    private List<Proyecto> listaProyectos = new ArrayList<Proyecto>();
    
    DataView<Proyecto> dataView;
    ListDataProvider<Proyecto> listDataProviderProyectos;
    public WebSesion getSesion() {
        return (WebSesion) getSession();
    }
    public Proyectos(String id) {
        super(id);
        System.out.println("com.app.docag.sis.home.Proyecto.<init>()");
        
        final ModalAgregarProyectos modalagregarproyecto=new ModalAgregarProyectos("modalagregarproyecto");
        
        modalagregarproyecto.setOutputMarkupId(true);
        add(modalagregarproyecto);
        
        final WebMarkupContainer tbodyIdiomas = new WebMarkupContainer("tbodyProyectos"); 
        final WebMarkupContainer theadProyectos = new WebMarkupContainer("theadProyectos"); 
        tbodyIdiomas.setOutputMarkupId(true);
        theadProyectos.setOutputMarkupId(true);
        listaProyectos=proyectoImpl.getAllProyectos();
        
        listDataProviderProyectos = new ListDataProvider<Proyecto>(listaProyectos);
        dataView = new DataView<Proyecto>("rowsProyectos", listDataProviderProyectos) {

            @Override
            protected void populateItem(Item<Proyecto> item) {
                if(listaProyectos.size()>0){
                    final Proyecto obj = item.getModelObject();
                    RepeatingView repeatingView = new RepeatingView("dataRowProyectos");
                    repeatingView.add(new Label(repeatingView.newChildId(), obj.getId_proyecto()+""));
                    repeatingView.add(new Label(repeatingView.newChildId(), obj.getNombre()));
                    item.add(repeatingView); 
                }                
            }            
        };
        if(listaProyectos.isEmpty()){
            tbodyIdiomas.add(new Label("lbl_mensaje", "Sin registros"));
            theadProyectos.setVisible(false);
        }else{
            theadProyectos.setVisible(true);
            tbodyIdiomas.add(new Label("lbl_mensaje", ""));
        }
        
        dataView.setItemsPerPage(6);
        dataView.setOutputMarkupId(true);
        add(theadProyectos);
        add(tbodyIdiomas.add(dataView));
        add(new IVDAjaxPagingNavigator("pagingNavigator", dataView));
        
        AjaxLink agregarproyecto = new AjaxLink("agregarproyecto") {
            @Override
            public void onClick(AjaxRequestTarget art) {
                if (AuthenticatedWebSession.get().isSignedIn()) {
                    System.out.println("click");
                    modalagregarproyecto.show(art);
                    modalagregarproyecto.show(true);
                }
            }
        };
        add(agregarproyecto);
    }
    
}
