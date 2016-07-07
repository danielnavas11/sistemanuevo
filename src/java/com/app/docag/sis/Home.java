package com.app.docag.sis;

import com.app.bootstrap.util.PreloaderBlue;
import com.app.docag.sis.home.HomeSeccion1;
import com.app.docag.sis.home.Materiales;
import java.io.Serializable;
import org.apache.wicket.RestartResponseAtInterceptPageException;
import org.apache.wicket.authroles.authorization.strategies.role.annotations.AuthorizeInstantiation;
import org.apache.wicket.behavior.AttributeAppender;
import org.apache.wicket.markup.html.WebMarkupContainer;
import org.apache.wicket.markup.html.image.Image;
import org.apache.wicket.request.cycle.RequestCycle;
import org.apache.wicket.request.resource.PackageResourceReference;

import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.markup.html.AjaxLink;

import org.apache.wicket.authroles.authentication.AuthenticatedWebSession;
import org.apache.wicket.markup.html.basic.Label;

/**
 *
 * @author daniel
 */
@AuthorizeInstantiation({"USER", "ADMIN"})
public class Home extends PaginaWebSIS implements Serializable {    
    final static org.apache.log4j.Logger log_erp = org.apache.log4j.Logger.getLogger(Home.class);
    public Home() throws InterruptedException{
        if (getSesion().getUsuario() == null) {
            Inicio content = new Inicio();
            throw new RestartResponseAtInterceptPageException(content);
        }else{
            WebMarkupContainer modalheader = new WebMarkupContainer("headerpic");
            modalheader.add(new AttributeAppender("style","background: url('"+RequestCycle.get().urlFor(new PackageResourceReference(imagenes.Imagenes.class, "user-bg.jpg") , null).toString()+"');"));
            add(modalheader);
            
            final Materiales materiales=new Materiales("HomeSeccion1");
            materiales.setOutputMarkupId(true);

            AjaxLink salirsistema=new AjaxLink("salirsistema") {
                @Override
                public void onClick(AjaxRequestTarget art) {
                    if(AuthenticatedWebSession.get().isSignedIn()){
                        AuthenticatedWebSession.get().signOut();
                        getSesionSIS().setUsuario(null);
                        log_erp.info("AuthenticatedWebSession.get().signOut()");
                        throw new RestartResponseAtInterceptPageException(new Inicio());
                    }
                }
            };
            add(salirsistema);

            add(modalheader.add(new Image("avatarPerfil",new PackageResourceReference(imagenes.Imagenes.class, "userIcon.png"))));
            final HomeSeccion1 home1=new HomeSeccion1("HomeSeccion1");
            home1.setOutputMarkupId(true);
            add(home1);
            
            final HomeSeccion1 home11=new HomeSeccion1("HomeSeccion1");
            home11.setOutputMarkupId(true);
            
            
            AjaxLink verperfil=new AjaxLink("verperfil") {
                @Override
                public void onClick(AjaxRequestTarget art) {
                    if(AuthenticatedWebSession.get().isSignedIn()){
                        System.out.println("click");
                    }
                }
            };
            add(verperfil);
            
            AjaxLink linkmateriales=new AjaxLink("linkmateriales") {
                @Override
                public void onClick(AjaxRequestTarget art) {
                    if(AuthenticatedWebSession.get().isSignedIn()){
                        System.out.println("linkmateriales");
                        this.getParent().addOrReplace(home1);
                        home1.replaceWith(materiales);
                        art.add(materiales);
                    }
                }
            };
            add(linkmateriales);
            
            AjaxLink linkhome=new AjaxLink("linkhome") {
                @Override
                public void onClick(AjaxRequestTarget art) {
                    if(AuthenticatedWebSession.get().isSignedIn()){
                        System.out.println("linkhome");
                        this.getParent().addOrReplace(home1);
                        home1.replaceWith(home11);
                        art.add(home11);
                    }
                }
            };
            add(linkhome);

        }
    }
    
     public final WebSesion getSesion() {
        return (WebSesion) getSession();
    }

    public final Integer getUserId() {
        return getSesion().getUsuario().getId_usuario();
    }
}
