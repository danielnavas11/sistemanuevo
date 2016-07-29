package com.app.docag.sis.proyectos;

import com.app.bootstrap.modal.ModalBootstrap;
import com.app.docag.sis.WebSesion;
import java.io.Serializable;
import org.apache.wicket.MarkupContainer;
import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.markup.html.WebMarkupContainer;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.PropertyModel;

/**
 * @author daniel
 */
public class ModalAgregarProyectos extends ModalBootstrap implements Serializable {
    
    Form addform;
    private MarkupContainer contenido;
    TextField<String>  txtproyecto;
    
    String txtproyecto_valor;
    
    public WebSesion getSesion() {
        return (WebSesion) getSession();
    }
    
    public ModalAgregarProyectos(String id) {
        super(id);
        contenido = new WebMarkupContainer("contentaddproyecto");
        contenido.setOutputMarkupId(true);
        addform = new Form("addproyecto");
        
        txtproyecto = new TextField<String>("txtproyecto", new PropertyModel<String>(this, "txtproyecto_valor"));
        
        addform.add(txtproyecto);
        
        contenido.add(addform);
        add(contenido);
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
