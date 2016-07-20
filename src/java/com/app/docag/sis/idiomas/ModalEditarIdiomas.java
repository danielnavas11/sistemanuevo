package com.app.docag.sis.idiomas;

import com.app.bootstrap.modal.ModalBootstrap;
import com.app.docag.sis.WebSesion;
import com.sis.persistencia.dao.pojos.Idioma;
import java.io.Serializable;
import org.apache.wicket.MarkupContainer;
import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.form.OnChangeAjaxBehavior;
import org.apache.wicket.markup.html.WebMarkupContainer;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.Model;
import org.apache.wicket.util.lang.Objects;

/**
 * @author daniel
 */
public class ModalEditarIdiomas extends ModalBootstrap implements Serializable{
   /** Objeto enviado por parámetro */
   Idioma idioma;
   Form editarform;
   private MarkupContainer contenido;
   TextField<String> txtidiomasiglas,txtidiomanombre;
   String txtidiomasiglas_valor,txtidiomanombre_valor;
   Object obj;
   Label lblididioma;
   public WebSesion getSesion() {
        return (WebSesion) getSession();
    }
   public ModalEditarIdiomas(String id){
       super(id);
   }

   public ModalEditarIdiomas(String id, Object obj){
       super(id);
       contenido = new WebMarkupContainer("content");
       contenido.setOutputMarkupId(true);
       editarform = new Form("EditarIdiomas");
       lblididioma=new Label("EditarIdiomasId","");
       lblididioma.setOutputMarkupId(true);
       editarform.add(lblididioma);
       
       txtidiomasiglas = new TextField<String>("EditarIdiomasSiglas",Model.of(""));
       txtidiomasiglas.setOutputMarkupId(true);
       txtidiomasiglas.add(new OnChangeAjaxBehavior(){
            @Override
            protected void onUpdate(AjaxRequestTarget art) {
                txtidiomasiglas_valor=Objects.stringValue(((TextField<String>) getComponent()).getInput(), true);
                art.add(txtidiomasiglas.setDefaultModel(Model.of(txtidiomasiglas_valor)));
            }
            
        });    
       
       txtidiomanombre = new TextField<String>("EditarIdiomasNombre",Model.of(""));
       txtidiomanombre.setOutputMarkupId(true);
       txtidiomanombre.setRequired(true);
       txtidiomanombre.add(new OnChangeAjaxBehavior(){
            @Override
            protected void onUpdate(AjaxRequestTarget art) {
                txtidiomanombre_valor=Objects.stringValue(((TextField<String>) getComponent()).getInput(), true);
                art.add(txtidiomanombre.setDefaultModel(Model.of(txtidiomanombre_valor)));
            }
            
        });    
       
       editarform.add(txtidiomasiglas);
       editarform.add(txtidiomanombre);
       contenido.add(editarform);
       add(contenido);
   }
   
   public void setearIdioma(Object obj){  
       setOutputMarkupId(true);
       idioma = (Idioma) obj;
       lblididioma.setDefaultModel(Model.of(""+idioma.getId_idioma()));
       txtidiomasiglas.setDefaultModel(Model.of(idioma.getSiglas()));
       txtidiomanombre.setDefaultModel(Model.of(idioma.getIdioma()));
       setTxtidiomasiglas_valor(""+idioma.getSiglas());
       setTxtidiomanombre_valor(""+idioma.getIdioma());
   }

    public TextField<String> getTxtidiomasiglas() {
        return txtidiomasiglas;
    }

    public void setTxtidiomasiglas(TextField<String> txtidiomasiglas) {
        this.txtidiomasiglas = txtidiomasiglas;
    }

    public TextField<String> getTxtidiomanombre() {
        return txtidiomanombre;
    }

    public void setTxtidiomanombre(TextField<String> txtidiomanombre) {
        this.txtidiomanombre = txtidiomanombre;
    }
   
    public String getTxtidiomasiglas_valor() {
        return txtidiomasiglas_valor;
    }

    public void setTxtidiomasiglas_valor(String txtidiomasiglas_valor) {
        this.txtidiomasiglas_valor = txtidiomasiglas_valor;
    }

    public String getTxtidiomanombre_valor() {
        return txtidiomanombre_valor;
    }

    public void setTxtidiomanombre_valor(String txtidiomanombre_valor) {
        this.txtidiomanombre_valor = txtidiomanombre_valor;
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
}
