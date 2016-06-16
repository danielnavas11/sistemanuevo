package com.app.docag.sis;           

import java.io.Serializable;
import org.apache.wicket.markup.head.CssHeaderItem;
import org.apache.wicket.markup.head.IHeaderResponse;
import org.apache.wicket.markup.head.JavaScriptReferenceHeaderItem;
import org.apache.wicket.markup.html.WebPage;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.include.Include;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.Model;
import org.apache.wicket.request.resource.JavaScriptResourceReference;
import org.apache.wicket.request.resource.PackageResourceReference;

/** 
 *
 * @author Daniel Navas
 * @version 
 */

public abstract class PaginaWebSIS extends WebPage implements Serializable{
    private static final JavaScriptResourceReference jquery = new JavaScriptResourceReference(js.Js.class, "jquery.js");
    private static final JavaScriptResourceReference bootstrap = new JavaScriptResourceReference(js.Js.class, "bootstrap2.js");
    private static final JavaScriptResourceReference formvalidador = new JavaScriptResourceReference(js.formvalidador.Js.class, "messages.js");
    
    public WebSesion getSesionERP() {
        return (WebSesion) getSession();
    }
    
    public PaginaWebSIS(IModel model) {
        super(model);
        add(new Label("titulo","SISDOCAG WEB"));
        add(new Include("menunav", "MenuNav.html"));
    }
    public PaginaWebSIS(){
        super(new Model());
        add(new Label("titulo","SISDOCAG WEB"));
        add(new Include("menunav", "MenuNav.html"));
    }
    @Override
    public void renderHead(IHeaderResponse response) {
        response.render(JavaScriptReferenceHeaderItem.forReference(jquery));
        response.render(JavaScriptReferenceHeaderItem.forReference(bootstrap));        
        response.render(JavaScriptReferenceHeaderItem.forReference(formvalidador));        
        response.render(CssHeaderItem.forReference(new PackageResourceReference(css.Css.class, "bootstrap2.css")));
        response.render(CssHeaderItem.forReference(new PackageResourceReference(css.Css.class, "bootstrap_modal.css")));
        response.render(CssHeaderItem.forReference(new PackageResourceReference(js.formvalidador.Js.class, "messages.css")));
    }
}
