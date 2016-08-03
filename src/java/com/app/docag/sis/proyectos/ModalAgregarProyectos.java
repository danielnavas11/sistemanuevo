package com.app.docag.sis.proyectos;

import com.app.bootstrap.modal.ModalBootstrap;
import com.app.docag.sis.WebSesion;
import com.sis.persistencia.dao.pojos.Empresa;
import com.sis.persistencia.h.EmpresaH;
import java.io.Serializable;
import java.util.List;
import org.apache.wicket.MarkupContainer;
import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.form.OnChangeAjaxBehavior;
import org.apache.wicket.markup.html.WebMarkupContainer;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.Model;
import org.apache.wicket.model.PropertyModel;
import org.apache.wicket.spring.injection.annot.SpringBean;
import org.apache.wicket.util.lang.Objects;

/**
 * @author daniel
 */
public class ModalAgregarProyectos extends ModalBootstrap implements Serializable {
    
    Form addform;
    final private MarkupContainer contenido;
    TextField<String>  txtproyecto;
    TextField txtnombreempresa;
    
    @SpringBean
    private EmpresaH empresaImpl;
    
    final IModel<Empresa> model = new Model<Empresa>();
    
    String txtproyecto_valor="",txtnombreempresa_valor="";
    
     
    public WebSesion getSesion() {
        return (WebSesion) getSession();
    }
    
    public ModalAgregarProyectos(String id) {
        super(id);
        contenido = new WebMarkupContainer("contentaddproyecto");
        contenido.setOutputMarkupId(true);
        
        
        final List<Empresa> empresas = empresaImpl.getAllEmpresas();        
        
        addform = new Form<Void>("addproyecto");
        
        txtnombreempresa = new TextField<String>("txtnombreempresa", new PropertyModel<String>(this, "txtnombreempresa_valor"));
        
        txtnombreempresa.add(new OnChangeAjaxBehavior() {
            @Override
            protected void onUpdate(AjaxRequestTarget art) {
                txtnombreempresa_valor = Objects.stringValue(((TextField<String>) getComponent()).getInput(), true);
                art.add(txtnombreempresa.setDefaultModel(Model.of(txtnombreempresa_valor)));
            }

        });
        
        txtproyecto = new TextField<String>("txtproyecto", new PropertyModel<String>(this, "txtproyecto_valor"));
        txtproyecto.add(new OnChangeAjaxBehavior() {
            @Override
            protected void onUpdate(AjaxRequestTarget art) {
                txtproyecto_valor = Objects.stringValue(((TextField<String>) getComponent()).getInput(), true);
                art.add(txtproyecto.setDefaultModel(Model.of(txtproyecto_valor)));
            }

        });
        
        Label txtproyectolabel=new Label("txtproyectolabel", Model.of(""+getSesion().getValorBundleLocaleIdioma("sis.proyecto.nombre")));
        addform.add(txtproyectolabel);
        
        Label txtnombreempresalabel=new Label("txtnombreempresalabel", Model.of(""+getSesion().getValorBundleLocaleIdioma("sis.proyecto.nombreempresa")));
        addform.add(txtnombreempresalabel);
        
        addform.add(txtnombreempresa);
        addform.add(txtproyecto);
        
        contenido.add(addform);
        add(contenido);
        
        
    }

    public TextField getTxtnombreempresa() {
        return txtnombreempresa;
    }

    public void setTxtnombreempresa(TextField txtnombreempresa) {
        this.txtnombreempresa = txtnombreempresa;
    }

    
    
    public String getTxtnombreempresa_valor() {
        return txtnombreempresa_valor;
    }

    public void setTxtnombreempresa_valor(String txtnombreempresa_valor) {
        this.txtnombreempresa_valor = txtnombreempresa_valor;
    }
    
    public TextField<String> getTxtproyecto() {
        return txtproyecto;
    }

    public void setTxtproyecto(TextField<String> txtproyecto) {
        this.txtproyecto = txtproyecto;
    }

    public String getTxtproyecto_valor() {
        return txtproyecto_valor;
    }

    public void setTxtproyecto_valor(String txtproyecto_valor) {
        this.txtproyecto_valor = txtproyecto_valor;
    }
    @Override
    public ModalBootstrap addCloseButton() {
        return super.addCloseButton();
    }

    @Override
    public ModalBootstrap header(IModel label) {
        return super.header(label);
    }

    @Override
    public void setTitulo(String titulo) {
        super.setTitulo(titulo);
    }

    @Override
    public ModalBootstrap addCloseButton(IModel label) {
        return super.addCloseButton(label);
    }

    @Override
    public ModalBootstrap show(boolean show) {
        return super.show(show);
    }

    @Override
    public ModalBootstrap show(AjaxRequestTarget target) {
        return super.show(target);
    }

    @Override
    public ModalBootstrap setHeaderVisible(boolean visible) {
        return super.setHeaderVisible(visible);
    }
}
