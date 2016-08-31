package com.app.docag.sis;           

import java.io.Serializable;
import org.apache.wicket.behavior.AttributeAppender;
import org.apache.wicket.extensions.ajax.markup.html.autocomplete.AutoCompleteBehavior;
import org.apache.wicket.markup.head.CssHeaderItem;
import org.apache.wicket.markup.head.IHeaderResponse;
import org.apache.wicket.markup.head.JavaScriptReferenceHeaderItem;
import org.apache.wicket.markup.html.WebMarkupContainer;
import org.apache.wicket.markup.html.WebPage;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.Model;
import org.apache.wicket.request.cycle.RequestCycle;
import org.apache.wicket.request.resource.JavaScriptResourceReference;
import org.apache.wicket.request.resource.PackageResourceReference;
import org.apache.wicket.request.resource.ResourceReference;

/** 
 *
 * @author Daniel Navas
 * @version 
 */

public abstract class PaginaWebSIS extends WebPage implements Serializable{
    private static final JavaScriptResourceReference jquery = new JavaScriptResourceReference(js.Js.class, "jquery.js");
    private static final JavaScriptResourceReference bootstrap = new JavaScriptResourceReference(js.Js.class, "bootstrap2.js");
    
    private static final JavaScriptResourceReference materialize = new JavaScriptResourceReference(materialui.Js.class, "materialize.js");
    
    private static final JavaScriptResourceReference jsapp = new JavaScriptResourceReference(js.Js.class, "app.js");
    
    private static final JavaScriptResourceReference growl = new JavaScriptResourceReference(js.Js.class, "bootstrap-growl.js");
    
    public WebSesion getSesionSIS() {
        return (WebSesion) getSession();
    }
    
    public PaginaWebSIS(IModel model) {
        super(model);
        WebMarkupContainer wicon = new WebMarkupContainer("wicon");
	//wicon.add(new AttributeAppender("href",""+RequestCycle.get().urlFor(new PackageResourceReference(imagenes.Imagenes.class, "IVD.png") , null).toString()));
	add(wicon);        
        add(new Label("titulo",getSesionSIS().getValorBundleLocaleIdioma("titulosistema")));
        //add(new Include("header", "MenuNav.html"));
        add(new HeaderPanel("headeranel",getSesionSIS().getUsuario(),getSesionSIS()));
    }
    public PaginaWebSIS(){
        super(new Model());
        WebMarkupContainer wicon = new WebMarkupContainer("wicon");
	//wicon.add(new AttributeAppender("href",""+RequestCycle.get().urlFor(new PackageResourceReference(imagenes.Imagenes.class, "IVD.png") , null).toString()));
	add(wicon);
        add(new Label("titulo",getSesionSIS().getValorBundleLocaleIdioma("titulosistema")));
        //add(new Include("header", "MenuNav.html"));
        add(new HeaderPanel("headeranel",getSesionSIS().getUsuario(),getSesionSIS()));
    }   
    @Override
    public void renderHead(IHeaderResponse response) {   
        ResourceReference AUTOCOMPLETE_JS = new PackageResourceReference(AutoCompleteBehavior.class, "wicket-autocomplete.js");
        
        response.render(JavaScriptReferenceHeaderItem.forReference(jquery));
        response.render(JavaScriptReferenceHeaderItem.forReference(bootstrap));
        
        response.render(JavaScriptReferenceHeaderItem.forReference(growl));
        
        response.render(JavaScriptReferenceHeaderItem.forReference(materialize));
        response.render(JavaScriptReferenceHeaderItem.forReference(jsapp));
        
        response.render(CssHeaderItem.forReference(new PackageResourceReference(css.Css.class, "animate.css")));
        response.render(CssHeaderItem.forReference(new PackageResourceReference(css.Css.class, "material-design-iconic-font.css")));
        response.render(CssHeaderItem.forReference(new PackageResourceReference(css.Css.class, "mCustomScrollbar.css")));
        response.render(CssHeaderItem.forReference(new PackageResourceReference(css.Css.class, "login.css")));
        response.render(CssHeaderItem.forReference(new PackageResourceReference(css.Css.class, "style1.css")));
        response.render(CssHeaderItem.forReference(new PackageResourceReference(css.Css.class, "style2.css")));
        
        response.render(CssHeaderItem.forReference(new PackageResourceReference(materialui.Css.class, "materialize.css")));
        
        response.render(JavaScriptReferenceHeaderItem.forReference(AUTOCOMPLETE_JS));
    }
}
