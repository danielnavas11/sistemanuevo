package com.app.docag.sis;           

import com.sis.persistencia.dao.pojos.Usuario;
import org.apache.wicket.markup.html.basic.Label;
import java.io.Serializable;
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
import org.apache.wicket.Session;
import org.apache.wicket.authentication.IAuthenticationStrategy;
import org.apache.wicket.request.cycle.RequestCycle;
import org.apache.wicket.request.resource.PackageResourceReference;
import org.apache.wicket.authroles.authentication.AuthenticatedWebSession;
import org.apache.wicket.request.mapper.parameter.PageParameters;


public class Inicio extends PaginaWebSIS implements Serializable{
    final TextField usuario;
    final PasswordTextField clave;
    private String usuariotext,clavetext;
    
    private Usuario usuarioObjeto;
    
    public Inicio() {
        /*if(Configurar.ERPConfigurado()){
            log_erp.info("Configuracion:".concat(Configurar.obtenerParametrosConfiguracion()));
        }else{
           log_erp.info("Configurar......");
           setResponsePage(ConfigurarOpciones.class);
        }*/
        //add(new Label("configurar", "Configurar"));
        /*AjaxLink configurar=new AjaxLink("configurar") {            
            @Override
            public void onClick(AjaxRequestTarget art) {                
                System.out.println("Click");
            }
        };
        configurar.setOutputMarkupId(true);
        configurar.add(new Label("lblconfigurar",Model.of("Configurar")));
        add(configurar);
        */
	//Label modalheader=new Label("modal-header", Model.of(""));
	WebMarkupContainer modalheader = new WebMarkupContainer("modalheader");
	modalheader.add(new AttributeAppender("style","background: url('"+RequestCycle.get().urlFor(new PackageResourceReference(imagenes.Imagenes.class, "user-bg.jpg") , null).toString()+"');"));
	add(modalheader);

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
                System.out.println("btnacceptar.onClick()");             
		//boolean authResult = 
                //usuarioObjeto=Aplicacion.get().getInicioSesion().getUsuarioLogin(usuariotext, usuariotext);
                //AuthenticatedWebSession.get().signIn(usuariotext, usuariotext);
		/*Home home = new Home();
                home.setUserId(usuariotext);
                home.setUserClave(clavetext);*/
            	//if authentication succeeds redirect user to the requested page
            	if(AuthenticatedWebSession.get().signIn(usuariotext, usuariotext)){
                    setResponsePage(Home.class);   
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
