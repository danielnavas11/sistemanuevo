package com.app.docag.sis.idiomas;

import com.app.bootstrap.util.IVDAjaxPagingNavigator;
import com.app.bootstrap.util.IVDMensajesJGROWL;
import com.app.docag.sis.WebSesion;
import com.sis.persistencia.dao.pojos.Idioma;
import com.sis.persistencia.h.IdiomaH;
import java.util.ArrayList;
import java.util.List;
import org.apache.wicket.Component;
import org.apache.wicket.ajax.AjaxEventBehavior;
import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.markup.html.AjaxLink;
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
public class Idiomas extends Panel {
    private List<Idioma> listaIdiomas = new ArrayList<Idioma>();
    @SpringBean
    private IdiomaH idiomaImpl;
    public WebSesion getSesion() {
        return (WebSesion) getSession();
    }
    
    public Idiomas(String id) {
        super(id);
        listaIdiomas=idiomaImpl.getAllIdiomas();
        final ModalEditarIdiomas modaleditaridiomas=new ModalEditarIdiomas("modaleditaridiomas",null);
        //modaleditaridiomas.setTitulo("Editar Idioma");
        modaleditaridiomas.addButton(new AjaxLink<String>("button", Model.of(getSesion().getValorBundleLocaleIdioma("inicio.configurar.boton.cerrar"))) {
            @Override
            protected void onConfigure() {
                super.onConfigure();
                setBody(getDefaultModel());
            }
            @Override
            public void onClick(AjaxRequestTarget art) {
                modaleditaridiomas.appendCloseDialogJavaScript(art);
            }
        });
        modaleditaridiomas.addButton(new AjaxLink<String>("button", Model.of(getSesion().getValorBundleLocaleIdioma("inicio.configurar.boton.guardar"))) {
            @Override
            protected void onConfigure() {
                super.onConfigure();
                setBody(getDefaultModel());
            }
             @Override
            public void onClick(AjaxRequestTarget art) {
                if(!modaleditaridiomas.getTxtidiomasiglas_valor().equals("")){
                    System.out.println("getTxtidiomasiglas_valor:"+modaleditaridiomas.getTxtidiomasiglas_valor());
                }else{
                    art.appendJavaScript(IVDMensajesJGROWL.ERPJGrowl.errorlogin("El campo Siglas del Idioma no puede estar vacio."));
                }
            }
        });
        modaleditaridiomas.setOutputMarkupId(true);
        add(modaleditaridiomas);
        System.out.println("listaIdiomas:"+listaIdiomas);
        ListDataProvider<Idioma> listDataProviderIdiomas = new ListDataProvider<Idioma>(listaIdiomas);
        DataView<Idioma> dataView = new DataView<Idioma>("rowsIdiomas", listDataProviderIdiomas) {
            @Override
            protected void populateItem(final Item<Idioma> item) {
                final Idioma idi = item.getModelObject();
                RepeatingView repeatingView = new RepeatingView("dataRowIdiomas");
                repeatingView.add(new Label(repeatingView.newChildId(), idi.getId_idioma()+""));
                repeatingView.add(new Label(repeatingView.newChildId(), idi.getSiglas()));
                repeatingView.add(new Label(repeatingView.newChildId(), idi.getIdioma()));
                Component lbl=new Label("dataRowEditar", "<button wicket:id=\"dataRowEditar\" type=\"button\" class=\"btnanimadocomandoedit btn btn-icon waves-effect command-edit waves-circle\" id=\"btnanimadocomandoedit\">\n" +
"                        <span class=\"zmdi zmdi-edit\"></span>\n" +
"                    </button>").setEscapeModelStrings(false);
                lbl.add(new AjaxEventBehavior("onclick") {
                    @Override
                    protected void onEvent(AjaxRequestTarget art) {
                        System.out.println("click "+idi.getId_idioma());
                        modaleditaridiomas.setearIdioma(idi);
                        art.add(modaleditaridiomas);
                        modaleditaridiomas.show(art);
                    }
                });
                repeatingView.add(lbl);
                item.add(repeatingView); 
            }
        };
        dataView.setItemsPerPage(6);
        add(dataView);
        add(new IVDAjaxPagingNavigator("pagingNavigator", dataView));
    }
    
    public Idiomas(String id, IModel<?> model) {
        super(id, model);
    }
    
}
