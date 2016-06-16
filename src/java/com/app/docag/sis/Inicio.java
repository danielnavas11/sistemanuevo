/*
 * Inicio.java
 *
 * Created on 15 de junio de 2016, 09:05 PM
 */

package com.app.docag.sis;           

import org.apache.wicket.markup.html.basic.Label;
import static com.app.docag.sis.Aplicacion.log_erp;
public class Inicio extends PaginaWebSIS {

    public Inicio() {
         if(Configurar.ERPConfigurado()){
            log_erp.info("Configuracion:".concat(Configurar.obtenerParametrosConfiguracion()));
        }else{
           log_erp.info("Configurar......");
            setResponsePage(ConfigurarOpciones.class);
        }
        add(new Label("configurarERP", "Configurar"));     
    }

}
