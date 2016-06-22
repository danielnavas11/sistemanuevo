package com.app.docag.sis;           

import org.apache.wicket.markup.html.basic.Label;
import static com.app.docag.sis.Aplicacion.log_erp;
import java.io.Serializable;
import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.markup.html.AjaxLink;
import org.apache.wicket.markup.html.include.Include;
import org.apache.wicket.model.Model;
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
        configurar.add(new Label("lblconfigurar",Model.of("Configurar el boton")));
        add(configurar);*/
    }

}
