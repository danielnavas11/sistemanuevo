package com.app.docag.sis.home;

import com.app.bootstrap.util.IVDAjaxPagingNavigator;
import com.app.bootstrap.util.IVDMensajesJGROWL;
import com.app.docag.sis.WebSesion;
import com.app.docag.sis.proyectos.ModalAgregarProyectos;
import com.sis.persistencia.dao.pojos.Empresa;
import com.sis.persistencia.h.ProyectoH;
import java.util.ArrayList;
import java.util.List;
import org.apache.wicket.markup.html.WebMarkupContainer;
import org.apache.wicket.markup.html.panel.Panel;
import org.apache.wicket.spring.injection.annot.SpringBean;
import com.sis.persistencia.dao.pojos.Proyecto;
import com.sis.persistencia.h.EmpresaH;
import org.apache.wicket.AttributeModifier;
import org.apache.wicket.Component;
import org.apache.wicket.ajax.AjaxEventBehavior;
import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.markup.html.AjaxLink;
import org.apache.wicket.authroles.authentication.AuthenticatedWebSession;
import org.apache.wicket.behavior.AttributeAppender;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.repeater.Item;
import org.apache.wicket.markup.repeater.RepeatingView;
import org.apache.wicket.markup.repeater.data.DataView;
import org.apache.wicket.markup.repeater.data.ListDataProvider;
import org.apache.wicket.model.Model;

/**
 * @author Daniel Navas
 */
public class Proyectos extends Panel {
    @SpringBean
    private ProyectoH proyectoImpl;
    
    @SpringBean
    private EmpresaH empresaImpl;
    
    private List<Proyecto> listaProyectos = new ArrayList<Proyecto>();
    
    DataView<Proyecto> dataView;
    ListDataProvider<Proyecto> listDataProviderProyectos;
    public WebSesion getSesion() {
        return (WebSesion) getSession();
    }
    public Proyectos(String id) {
        super(id);
        System.out.println("com.app.docag.sis.home.Proyecto.<init>()");
        
        final Label lbl_mensaje=new Label("lbl_mensaje", "Sin registros");
        lbl_mensaje.setOutputMarkupId(true);
        
        final WebMarkupContainer tbody = new WebMarkupContainer("tbodyProyectos"); 
        final WebMarkupContainer theadProyectos = new WebMarkupContainer("theadProyectos"); 
        tbody.setOutputMarkupId(true);
        theadProyectos.setOutputMarkupId(true);
        listaProyectos=proyectoImpl.getAllProyectos();
        
        final ModalAgregarProyectos modalagregarproyecto=new ModalAgregarProyectos("modalagregarproyecto");
        modalagregarproyecto.addButton(new AjaxLink<String>("button", Model.of(getSesion().getValorBundleLocaleIdioma("inicio.configurar.boton.cerrar"))) {
            @Override
            protected void onConfigure() {
                super.onConfigure();
                setBody(getDefaultModel());
            }
            @Override
            public void onClick(AjaxRequestTarget art) {
                modalagregarproyecto.appendCloseDialogJavaScript(art);
            }
        });
        
        modalagregarproyecto.addButton(new AjaxLink<String>("button", Model.of(getSesion().getValorBundleLocaleIdioma("inicio.configurar.boton.guardar"))) {
            @Override
            protected void onConfigure() {
                super.onConfigure();
                setBody(getDefaultModel());
            }
            @Override
            public void onClick(AjaxRequestTarget art) {
                if(modalagregarproyecto.getTxtnombreempresa_valor().equals("") ){
                    art.appendJavaScript(IVDMensajesJGROWL.ERPJGrowl.errorlogin("El nombre de la Empresa no puede estar vacio."));
                }else if(modalagregarproyecto.getTxtproyecto_valor().equals("")){
                    art.appendJavaScript(IVDMensajesJGROWL.ERPJGrowl.errorlogin("El nombre del Proecto no puede estar vacio."));
                }else{
                    Empresa objnuevoe=new Empresa(modalagregarproyecto.getTxtnombreempresa_valor(),true);
                    Proyecto objnuevop=new Proyecto(modalagregarproyecto.getTxtproyecto_valor(),true);
                    boolean b1=proyectoImpl.guardarProyecto(objnuevop);
                    boolean b2=empresaImpl.guardarEmpresa(objnuevoe);
                    
                    if(b1 && b2){
                        art.prependJavaScript(IVDMensajesJGROWL.ERPJGrowl.info("Guardado con Exito!"));
                        listaProyectos.clear();
                        listaProyectos.addAll(proyectoImpl.getAllProyectos());
                        lbl_mensaje.setVisible(false);
                        lbl_mensaje.add(new AttributeAppender("class",""));
                        lbl_mensaje.add(new AttributeAppender("style","display:none"));
                        tbody.add(lbl_mensaje);
                        tbody.add(dataView);
                        art.add(tbody);
                    }else{
                        art.prependJavaScript(IVDMensajesJGROWL.ERPJGrowl.errorlogin("Error al Guardar"));
                    }                     
                    modalagregarproyecto.appendCloseDialogJavaScript(art); 
                }
            }
        });
        modalagregarproyecto.setOutputMarkupId(true);
        add(modalagregarproyecto);
        
        
        
        listDataProviderProyectos = new ListDataProvider<Proyecto>(listaProyectos);
        dataView = new DataView<Proyecto>("rowsProyectos", listDataProviderProyectos) {

            @Override
            protected void populateItem(Item<Proyecto> item) {
                if(listaProyectos.size()>0){
                    final Proyecto obj = item.getModelObject();
                    RepeatingView repeatingView = new RepeatingView("dataRowProyectos");
                    repeatingView.add(new Label(repeatingView.newChildId(), obj.getId_proyecto()+""));
                    repeatingView.add(new Label(repeatingView.newChildId(), obj.getNombre()));
                    repeatingView.add(new Label(repeatingView.newChildId(), Model.of("Activo")));
                    Component lbl = new Label("dataRowEditarP", "<button wicket:id=\"dataRowEditarP\" type=\"button\" class=\"btnanimadocomandoedit btn btn-icon waves-effect command-edit waves-circle\" id=\"btnanimadocomandoeditP\">\n"
                            + "                        <span class=\"zmdi zmdi-edit\"></span>\n"
                            + "                    </button>").setEscapeModelStrings(false);
                    lbl.add(new AjaxEventBehavior("onclick") {
                        @Override
                        protected void onEvent(AjaxRequestTarget art) {
                            System.out.println(obj.getId_proyecto());
                        }
                    });
                    repeatingView.add(lbl);
                    item.add(repeatingView); 
                }                
            }            
        };
        
        if(listaProyectos.isEmpty()){
            lbl_mensaje.add(new AttributeAppender("class","alert alert-info alert-dismissible"));
            lbl_mensaje.add(new AttributeAppender("style","display:block"));            
            lbl_mensaje.setVisible(true);
            tbody.add(lbl_mensaje);
        }else{
            lbl_mensaje.setVisible(false);
            lbl_mensaje.add(new AttributeAppender("class",""));
            lbl_mensaje.add(new AttributeAppender("style","display:none"));
            tbody.add(lbl_mensaje);
        }
        
        dataView.setItemsPerPage(6);
        dataView.setOutputMarkupId(true);
        add(theadProyectos);
        add(tbody.add(dataView));
        add(new IVDAjaxPagingNavigator("pagingNavigator", dataView));
        
        AjaxLink agregarproyecto = new AjaxLink("agregarproyecto") {
            @Override
            public void onClick(AjaxRequestTarget art) {
                if (AuthenticatedWebSession.get().isSignedIn()) {
                    modalagregarproyecto.setTxtnombreempresa_valor("");
                    modalagregarproyecto.getTxtnombreempresa().setDefaultModel(Model.of(""));
                    modalagregarproyecto.setTxtproyecto_valor("");
                    modalagregarproyecto.getTxtproyecto().setDefaultModel(Model.of(""));
                    modalagregarproyecto.show(art);
                    art.add(modalagregarproyecto);
                }
            }
        };
        add(agregarproyecto);
    }
    
}
