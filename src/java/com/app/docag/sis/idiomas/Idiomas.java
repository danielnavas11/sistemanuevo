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
public class Idiomas extends Panel {
    private List<Idioma> listaIdiomas = new ArrayList<Idioma>();
    @SpringBean
    private IdiomaH idiomaImpl;
    DataView<Idioma> dataView;
    ListDataProvider<Idioma> listDataProviderIdiomas;
    public WebSesion getSesion() {
        return (WebSesion) getSession();
    }
    
    public Idiomas(String id) {
        super(id);
        final WebMarkupContainer tbodyIdiomas = new WebMarkupContainer("tbodyIdiomas"); 
        tbodyIdiomas.setOutputMarkupId(true);
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
                if(modaleditaridiomas.getTxtidiomanombre_valor().equals("") ){
                    art.appendJavaScript(IVDMensajesJGROWL.ERPJGrowl.errorlogin("El nombre del Idioma no puede estar vacio."));
                }else if(modaleditaridiomas.getTxtidiomasiglas_valor().equals("")){
                    art.appendJavaScript(IVDMensajesJGROWL.ERPJGrowl.errorlogin("El campo Sigla del Idioma no puede estar vacio."));
                }else{
                    Idioma idiedit=new Idioma(modaleditaridiomas.getIdioma().getId_idioma(), modaleditaridiomas.getTxtidiomanombre_valor(),modaleditaridiomas.getTxtidiomasiglas_valor());
                    boolean res=idiomaImpl.guardarIdioma(idiedit);
                    if(res){
                        listaIdiomas.clear();
                        listaIdiomas.addAll(idiomaImpl.getAllIdiomas());
                        modaleditaridiomas.appendCloseDialogJavaScript(art);
                        art.add(tbodyIdiomas);
                    }else{
                        art.appendJavaScript(IVDMensajesJGROWL.ERPJGrowl.errorlogin("El Idioma no se pudo actualizar."));
                    }                    
                }
            }
        });
        modaleditaridiomas.setOutputMarkupId(true);
        add(modaleditaridiomas);
        listDataProviderIdiomas = new ListDataProvider<Idioma>(listaIdiomas);
        dataView = new DataView<Idioma>("rowsIdiomas", listDataProviderIdiomas) {
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
        dataView.setOutputMarkupId(true);
        add(tbodyIdiomas.add(dataView));
        add(new IVDAjaxPagingNavigator("pagingNavigator", dataView));
    }
    
    public Idiomas(String id, IModel<?> model) {
        super(id, model);
    }
    
}
