package com.app.docag.sis;           

import com.app.bootstrap.util.IVDMensajesJGROWL;
import com.sis.persistencia.criptografia.IVDCrypto;
import org.apache.wicket.markup.html.basic.Label;
import java.io.Serializable;
import org.apache.wicket.RestartResponseAtInterceptPageException;
import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.form.AjaxFormComponentUpdatingBehavior;
import org.apache.wicket.ajax.markup.html.AjaxLink;
import org.apache.wicket.markup.html.WebMarkupContainer;
import org.apache.wicket.behavior.AttributeAppender;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.PasswordTextField;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.markup.html.image.Image;
import org.apache.wicket.model.Model;
import org.apache.wicket.request.cycle.RequestCycle;
import org.apache.wicket.request.resource.PackageResourceReference;
import org.apache.wicket.authroles.authentication.AuthenticatedWebSession;
import org.apache.wicket.markup.html.panel.Panel;


public class Inicio extends PaginaWebSIS implements Serializable{
    final TextField usuario;
    final PasswordTextField clave;
    private String usuariotext,clavetext;
        
    final static org.apache.log4j.Logger log_erp = org.apache.log4j.Logger.getLogger(Inicio.class);

    @Override
    protected void onConfigure() {
        super.onConfigure();
        if(AuthenticatedWebSession.get().isSignedIn()){
            try {
                throw new RestartResponseAtInterceptPageException(new Home());
            } catch (InterruptedException ex) {
                log_erp.error(ex.getMessage(), ex);
            }
        }
    }
    
    
    
    public Inicio() { 
        addOrReplace(new HeaderPanel("headeranel"));
        final Label error=new Label("mensajeslogin", "");
        error.setOutputMarkupId(true);
        add(error);
                
	WebMarkupContainer modalheader = new WebMarkupContainer("modalheader");
	modalheader.add(new AttributeAppender("style","background: url('"+RequestCycle.get().urlFor(new PackageResourceReference(imagenes.Imagenes.class, "user-bg.jpg") , null).toString()+"');"));
	add(modalheader);
        
        modalheader.add(new Label("titulologin", Model.of(getSesionSIS().getValorBundleLocaleIdioma("titulologin"))));       

        Form<Void> form_login = new Form<Void> ("form_login");
        
        
        usuario = new TextField<String>("usuario",Model.of(""));
        usuario.setRequired(true);
        usuario.setOutputMarkupId(true);
        usuario.add(new AjaxFormComponentUpdatingBehavior("change") {
            @Override
            protected void onUpdate(AjaxRequestTarget target) {
                usuariotext=usuario.getInput();
            }
        });
        usuario.add(new AttributeAppender("placeholder", getSesionSIS().getValorBundleLocaleIdioma("inicio.usuario")));
        form_login.add(usuario);
        
        clave = new PasswordTextField("clave",Model.of(""));
        clave.setRequired(true);
        clave.setOutputMarkupId(true);
        clave.add(new AjaxFormComponentUpdatingBehavior("change") {
            @Override
            protected void onUpdate(AjaxRequestTarget target) {
                clavetext=clave.getInput();
            }
        });
        clave.add(new AttributeAppender("placeholder", getSesionSIS().getValorBundleLocaleIdioma("inicio.clave")));
        form_login.add(clave);
               
        AjaxLink btnacceptar=new AjaxLink("btnacceptar") {            
            @Override
            public void onClick(AjaxRequestTarget art) {             
                log_erp.info("btnacceptar.onClick()");
                if(usuariotext==null || "".equals(usuariotext)){
                    art.appendJavaScript(IVDMensajesJGROWL.ERPJGrowl.errorlogin("Usuario Invalido."));
                    art.appendJavaScript("document.getElementById('" + usuario.getMarkupId() + "').focus();");
                }else if(clavetext ==null || "".equals(clavetext)){
                    art.appendJavaScript(IVDMensajesJGROWL.ERPJGrowl.errorlogin("Clave Invalida."));
                    art.appendJavaScript("document.getElementById('" + clave.getMarkupId() + "').focus();");
                }else{
                    if(AuthenticatedWebSession.get().signIn(usuariotext, IVDCrypto.encriptaTexto(clavetext))){
                        setResponsePage(Home.class);   
                    }else{
                        art.appendJavaScript(IVDMensajesJGROWL.ERPJGrowl.errorlogin("Usuario Invalido. Verifique e intente de nuevo."));
                    }
                }
            }
        };
        
        btnacceptar.add(new Label("lblbtnacceptar", Model.of(getSesionSIS().getValorBundleLocaleIdioma("inicio.acceptar"))));
        //add(btnacceptar);
        form_login.add(btnacceptar);
        
        modalheader.add(new Image("avatarLogin",new PackageResourceReference(imagenes.Imagenes.class, "userIcon.png")));
        
        add(form_login);
    }

}
