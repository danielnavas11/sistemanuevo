package com.app.docag.sis;           

import org.apache.wicket.markup.html.basic.Label;
import static com.app.docag.sis.Aplicacion.log_erp;
import java.io.Serializable;
import org.apache.wicket.AttributeModifier;
import org.apache.wicket.ajax.AjaxEventBehavior;
import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.markup.html.AjaxLink;
import org.apache.wicket.behavior.AttributeAppender;
import org.apache.wicket.markup.html.form.Button;
import org.apache.wicket.markup.html.form.PasswordTextField;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.markup.html.image.Image;
import org.apache.wicket.markup.html.include.Include;
import org.apache.wicket.model.AbstractReadOnlyModel;
import org.apache.wicket.model.Model;
import org.apache.wicket.request.resource.ContextRelativeResource;
import org.apache.wicket.request.resource.PackageResourceReference;
public class Inicio extends PaginaWebSIS implements Serializable{

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
        TextField usuario = new TextField("usuario");
        usuario.setRequired(true);
        usuario.add(new AttributeAppender("placeholder", getSesionSIS().getValorBundleLocaleIdioma("inicio.usuario")));
        add(usuario);
        
        PasswordTextField clave = new PasswordTextField("clave");
        clave.setRequired(true);
        clave.add(new AttributeAppender("placeholder", getSesionSIS().getValorBundleLocaleIdioma("inicio.clave")));
        add(clave);
        
               
        AjaxLink btnacceptar=new AjaxLink("btnacceptar") {            
            @Override
            public void onClick(AjaxRequestTarget art) {                
                System.out.println("btnacceptar.onClick()");
            }
        };
        
        btnacceptar.add(new Label("lblbtnacceptar", Model.of(getSesionSIS().getValorBundleLocaleIdioma("inicio.acceptar"))));
        add(btnacceptar);
        
        add(new Image("avatarLogin",new PackageResourceReference(imagenes.Imagenes.class, "userIcon.png")));
    }

}
