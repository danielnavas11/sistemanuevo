package com.app.docag.sis.admin;

import com.app.docag.sis.idiomas.Idiomas;
import com.app.docag.sis.moneda.Monedas;
import org.apache.wicket.markup.html.panel.Panel;

/**
 * @author daniel
 */
public class AdministracionSistema extends Panel {
    
    public AdministracionSistema(String id){
        super(id);
        add(new Idiomas("tabidiomas"));
        add(new Monedas("tabmonedas"));
        System.out.println("com.app.docag.sis.admin.AdministracionSistema.<init>()");
        
    }  
}
