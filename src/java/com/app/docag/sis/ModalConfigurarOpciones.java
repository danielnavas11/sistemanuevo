/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.app.docag.sis;

import com.app.bootstrap.modal.ModalBootstrap;
import com.app.docag.sis.beans.java.TipoConexionBDConfigurar;
import java.util.ArrayList;
import java.util.List;
import org.apache.wicket.MarkupContainer;
import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.form.OnChangeAjaxBehavior;
import org.apache.wicket.markup.html.WebMarkupContainer;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.form.ChoiceRenderer;
import org.apache.wicket.markup.html.form.DropDownChoice;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.PasswordTextField;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.Model;
import org.apache.wicket.model.PropertyModel;

/**
 *
 * @author Daniel Navas
 */
public class ModalConfigurarOpciones extends ModalBootstrap{
    private final String[] tiposconex = getSesion().getValorBundleLocaleIdioma("inicio.configurar.tiposbdarray").toString().split(",");
    TipoConexionBDConfigurar tipoconexbd=new TipoConexionBDConfigurar();
    private final List<TipoConexionBDConfigurar> listaTiposConexDB = new ArrayList<TipoConexionBDConfigurar>();
    private DropDownChoice<TipoConexionBDConfigurar> cmb_select_bd=null;
    Form configurarerpform;
    final private MarkupContainer contenido;
    Label labelusuariobd,labelclaveusuariobd,labelbasededatosselect;
    TextField<String> txtusuariobd;
    PasswordTextField txtclaveusuariobd;
    String txtusuariobd_valor="",txtclaveusuariobd_valor="";
    
    public WebSesion getSesion() {
        return (WebSesion) getSession();
    }
    public ModalConfigurarOpciones(String id) {
        super(id);
        contenido = new WebMarkupContainer("content");
        contenido.setOutputMarkupId(true);
        listaTiposConexDB.clear();
        for (int i = 0; i < tiposconex.length; i++) {
            tipoconexbd = new TipoConexionBDConfigurar();
            tipoconexbd.setId_tipo_conexcion(i);
            tipoconexbd.setDescripcion(tiposconex[i]);
            listaTiposConexDB.add(tipoconexbd);
            tipoconexbd = null;
        }

        configurarerpform = new Form("configurarerpform");
        
        labelbasededatosselect=new Label("labelbasededatosselect");
        labelbasededatosselect.setDefaultModel(Model.of(getSesion().getValorBundleLocaleIdioma("inicio.configurar.label.tipobd")));
        
        labelusuariobd=new Label("usuariobd");
        labelusuariobd.setDefaultModel(Model.of(getSesion().getValorBundleLocaleIdioma("inicio.configurar.label.usuariobd")));
        
        labelclaveusuariobd=new Label("clavebd");
        labelclaveusuariobd.setDefaultModel(Model.of(getSesion().getValorBundleLocaleIdioma("inicio.configurar.label.clavebd")));
        
        configurarerpform.setOutputMarkupId(true);
        cmb_select_bd = new DropDownChoice<TipoConexionBDConfigurar>("basededatosselect", new PropertyModel<TipoConexionBDConfigurar>(this, "tipoconexbd"),
                listaTiposConexDB, new ChoiceRenderer<TipoConexionBDConfigurar>("descripcion", "id_tipo_conexcion"));
        cmb_select_bd.setOutputMarkupId(true);
        configurarerpform.add(labelusuariobd);
        configurarerpform.add(labelclaveusuariobd);
        configurarerpform.add(labelbasededatosselect);
        
        txtusuariobd = new TextField<String>("txtusuariobd",Model.of(""));
        txtusuariobd.setOutputMarkupId(true);
        txtusuariobd.setRequired(true);
        txtusuariobd.add(new OnChangeAjaxBehavior(){
            @Override
            protected void onUpdate(AjaxRequestTarget art) {
                txtusuariobd_valor=((TextField<String>) getComponent()).getModelObject();
            }
            
        });        
        configurarerpform.add(txtusuariobd);
        
        txtclaveusuariobd = new PasswordTextField("txtclaveusuariobd",Model.of(""));
        txtclaveusuariobd.setOutputMarkupId(true);
        txtclaveusuariobd.setRequired(true);
        txtclaveusuariobd.add(new OnChangeAjaxBehavior(){
            @Override
            protected void onUpdate(AjaxRequestTarget art) {
                txtclaveusuariobd_valor=((TextField<String>) getComponent()).getModelObject();
            }
            
        });        
        configurarerpform.add(txtclaveusuariobd);
        
        contenido.add(configurarerpform.add(cmb_select_bd));
        add(contenido);
    }
    
    public String getTxtusuariobdMarkupId() {
        return txtusuariobd.getMarkupId();
    }
    
    public String getTxtclavesuariobdMarkupId() {
        return txtclaveusuariobd.getMarkupId();
    }
    public String getTextUsuarioValor(){        
        return txtusuariobd_valor;        
    }
    
    public String getTextClaveUsuarioValor(){        
        return txtclaveusuariobd_valor;        
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
