package com.app.docag.sis.moneda;

import com.app.bootstrap.util.IVDAjaxPagingNavigator;
import com.app.bootstrap.util.IVDMensajesJGROWL;
import com.app.docag.sis.WebSesion;
import com.sis.persistencia.dao.pojos.Moneda;
import com.sis.persistencia.h.MonedaH;
import java.util.ArrayList;
import java.util.List;
import org.apache.wicket.Component;
import org.apache.wicket.ajax.AjaxEventBehavior;
import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.markup.html.AjaxLink;
import org.apache.wicket.markup.html.WebMarkupContainer;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.panel.Panel;
import org.apache.wicket.markup.repeater.Item;
import org.apache.wicket.markup.repeater.RepeatingView;
import org.apache.wicket.markup.repeater.data.DataView;
import org.apache.wicket.markup.repeater.data.ListDataProvider;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.Model;
import org.apache.wicket.spring.injection.annot.SpringBean;

/**
 * @author daniel
 */
public class Monedas extends Panel {
    private List<Moneda> listaMonedas = new ArrayList<Moneda>();
    @SpringBean
    private MonedaH monedaImpl;
    DataView<Moneda> dataView;
    ListDataProvider<Moneda> listDataProviderMonedas;
    
    public WebSesion getSesion() {
        return (WebSesion) getSession();
    }
    
    public Monedas(String id, IModel<?> model) {
        super(id, model);
    }

    public Monedas(String id) {
        super(id);
        final WebMarkupContainer tbody = new WebMarkupContainer("tbodyMonedas"); 
        tbody.setOutputMarkupId(true);
        listaMonedas=monedaImpl.getAllMonedas();
        
        final ModalEditarMonedas modaleditar=new ModalEditarMonedas("modaleditarmonedas", null);
        modaleditar.addButton(new AjaxLink<String>("button", Model.of(getSesion().getValorBundleLocaleIdioma("inicio.configurar.boton.cerrar"))) {
            @Override
            protected void onConfigure() {
                super.onConfigure();
                setBody(getDefaultModel());
            }
            @Override
            public void onClick(AjaxRequestTarget art) {
                modaleditar.appendCloseDialogJavaScript(art);
            }
        });
        modaleditar.addButton(new AjaxLink<String>("button", Model.of(getSesion().getValorBundleLocaleIdioma("inicio.configurar.boton.guardar"))) {
            @Override
            protected void onConfigure() {
                super.onConfigure();
                setBody(getDefaultModel());
            }
            @Override
            public void onClick(AjaxRequestTarget art) {
                if(modaleditar.getTxtmoneda_valor().equals("") ){
                    art.appendJavaScript(IVDMensajesJGROWL.ERPJGrowl.errorlogin("El nombre de la Moneda no puede estar vacio."));
                }else{
                    Moneda objedit=new Moneda();
                    objedit.setId_moneda(modaleditar.getMoneda().getId_moneda());
                    objedit.setMoneda(modaleditar.getTxtmoneda_valor());
                    boolean res=monedaImpl.guardarMoneda(objedit);
                    if(res){
                        listaMonedas.clear();
                        listaMonedas.addAll(monedaImpl.getAllMonedas());
                        modaleditar.appendCloseDialogJavaScript(art);
                        art.add(tbody);
                    }else{
                        art.appendJavaScript(IVDMensajesJGROWL.ERPJGrowl.errorlogin("La Moneda no se pudo actualizar."));
                    }  
                }
            }
            
        });
        modaleditar.setOutputMarkupId(true);
        add(modaleditar);
        listDataProviderMonedas = new ListDataProvider<Moneda>(listaMonedas);
        dataView = new DataView<Moneda>("rowsMonedas", listDataProviderMonedas) {
            @Override
            protected void populateItem(Item<Moneda> item) {
                final Moneda moneda = item.getModelObject();
                RepeatingView repeatingView = new RepeatingView("dataRowMonedas");
                repeatingView.add(new Label(repeatingView.newChildId(), moneda.getId_moneda()+""));
                repeatingView.add(new Label(repeatingView.newChildId(), moneda.getMoneda()));
                Component lbl=new Label("dataRowEditarMoneda", "<button wicket:id=\"dataRowEditarMoneda\" type=\"button\" class=\"btnanimadocomandoedit btn btn-icon waves-effect command-edit waves-circle\">\n" +
"                        <span class=\"zmdi zmdi-edit\"></span>\n" +
"                    </button>").setEscapeModelStrings(false);
                lbl.add(new AjaxEventBehavior("onclick") {
                    @Override
                    protected void onEvent(AjaxRequestTarget art) {
                        modaleditar.setearMoneda(moneda);                        
                        art.add(modaleditar);
                        modaleditar.show(art);
                    }
                });
                repeatingView.add(lbl);
                item.add(repeatingView); 
            }
            
        };
        dataView.setItemsPerPage(6);
        dataView.setOutputMarkupId(true);
        add(tbody.add(dataView));
        add(new IVDAjaxPagingNavigator("pagingNavigator", dataView));
    }
    
}
