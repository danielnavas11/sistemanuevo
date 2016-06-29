package com.app.docag.sis.errores;

import com.app.docag.sis.Aplicacion;
import com.app.docag.sis.Inicio;
import com.app.docag.sis.PaginaWebSIS;
import javax.servlet.http.HttpServletResponse;
import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.markup.html.AjaxLink;
import org.apache.wicket.behavior.AttributeAppender;
import org.apache.wicket.markup.html.WebMarkupContainer;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.request.http.WebResponse;

import org.apache.wicket.model.Model;
import org.apache.wicket.request.cycle.RequestCycle;
import org.apache.wicket.request.resource.PackageResourceReference;

/**
 *
 * @author Daniel Navas
 */
public final class AccesoDenegado extends PaginaWebSIS{
    public AccesoDenegado() {
        WebMarkupContainer wicon = new WebMarkupContainer("wicon");
	wicon.add(new AttributeAppender("href",""+RequestCycle.get().urlFor(new PackageResourceReference(imagenes.Imagenes.class, "DGO.png") , null).toString()));
	add(wicon);
        AjaxLink btnacceptar=new AjaxLink("linkinicio") {            
            @Override
            public void onClick(AjaxRequestTarget art) {
                getSesionSIS().invalidate();
                getSesionSIS().invalidateNow();
                System.out.println("invalidateNow");
                setResponsePage(new Inicio());
            }
        };
        
        btnacceptar.add(new Label("lbllinkinicio", Model.of("Homepage")));
        add(btnacceptar);
    }

    @Override
    protected void configureResponse(WebResponse response) {
        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        super.configureResponse(response);
    }
    
    
}
