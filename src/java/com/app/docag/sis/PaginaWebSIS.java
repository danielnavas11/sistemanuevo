package com.app.docag.sis;           

import java.io.Serializable;
import org.apache.wicket.behavior.AttributeAppender;
import org.apache.wicket.markup.head.CssHeaderItem;
import org.apache.wicket.markup.head.IHeaderResponse;
import org.apache.wicket.markup.head.JavaScriptReferenceHeaderItem;
import org.apache.wicket.markup.html.WebMarkupContainer;
import org.apache.wicket.markup.html.WebPage;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.include.Include;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.Model;
import org.apache.wicket.request.cycle.RequestCycle;
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
    
    private static final JavaScriptResourceReference materialize = new JavaScriptResourceReference(materialui.Js.class, "materialize.js");
    
    private static final JavaScriptResourceReference jsapp = new JavaScriptResourceReference(js.Js.class, "app.js");
    
    public WebSesion getSesionSIS() {
        return (WebSesion) getSession();
    }
    
    public PaginaWebSIS(IModel model) {
        super(model);
        WebMarkupContainer wicon = new WebMarkupContainer("wicon");
	wicon.add(new AttributeAppender("href",""+RequestCycle.get().urlFor(new PackageResourceReference(imagenes.Imagenes.class, "DGO.png") , null).toString()));
	add(wicon);
        add(new Label("titulo","DGO Software"));
        add(new Include("header", "MenuNav.html"));
    }
    public PaginaWebSIS(){
        super(new Model());
        WebMarkupContainer wicon = new WebMarkupContainer("wicon");
	wicon.add(new AttributeAppender("href",""+RequestCycle.get().urlFor(new PackageResourceReference(imagenes.Imagenes.class, "DGO.png") , null).toString()));
	add(wicon);
        add(new Label("titulo","DGO Software"));
        add(new Include("header", "MenuNav.html"));
    }   
    @Override
    public void renderHead(IHeaderResponse response) {   
        response.render(JavaScriptReferenceHeaderItem.forReference(jquery));
        response.render(JavaScriptReferenceHeaderItem.forReference(bootstrap));        
        response.render(JavaScriptReferenceHeaderItem.forReference(formvalidador));
        
        response.render(JavaScriptReferenceHeaderItem.forReference(materialize));
        response.render(JavaScriptReferenceHeaderItem.forReference(jsapp));
        
        response.render(CssHeaderItem.forReference(new PackageResourceReference(css.Css.class, "bootstrap2.css")));
        response.render(CssHeaderItem.forReference(new PackageResourceReference(css.Css.class, "bootstrap_modal.css")));
        response.render(CssHeaderItem.forReference(new PackageResourceReference(css.Css.class, "material-design-iconic-font.css")));
        response.render(CssHeaderItem.forReference(new PackageResourceReference(css.Css.class, "jquery.css")));
        response.render(CssHeaderItem.forReference(new PackageResourceReference(css.Css.class, "login.css")));
        response.render(CssHeaderItem.forReference(new PackageResourceReference(css.Css.class, "style1.css")));
        response.render(CssHeaderItem.forReference(new PackageResourceReference(css.Css.class, "style2.css")));
        response.render(CssHeaderItem.forReference(new PackageResourceReference(css.Css.class, "fullcalendar.css")));
        
        response.render(CssHeaderItem.forReference(new PackageResourceReference(materialui.Css.class, "materialize.css")));
        
        response.render(CssHeaderItem.forReference(new PackageResourceReference(js.formvalidador.Js.class, "messages.css")));
    }
}
