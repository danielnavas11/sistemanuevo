package com.app.docag.sis;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.net.URISyntaxException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.markup.html.AjaxLink;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.model.Model;

/**
 *
 * @author Daniel Navas
 */
public class ConfigurarOpciones extends PaginaWebSIS implements Serializable{
    final static org.apache.log4j.Logger log_erp = org.apache.log4j.Logger.getLogger(ConfigurarOpciones.class);
    static String conf_archivo = "com/app/docag/sis/configurar.properties";
    static InputStream inputStream;
    static Properties prop = new Properties();
    public ConfigurarOpciones() {
        
        final ModalConfigurarOpciones modal=new ModalConfigurarOpciones("modalConfigurarERP");
        modal.setTitulo(getSesionSIS().getValorBundleLocaleIdioma("inicio.configurar.modal.titulo"));
        modal.show(true);
        modal.addButton(new AjaxLink<String>("button", Model.of(getSesionSIS().getValorBundleLocaleIdioma("inicio.configurar.boton.guardar"))) {
            @Override
            protected void onConfigure() {
                super.onConfigure();
                setBody(getDefaultModel());                
            }
            @Override
            public void onClick(final AjaxRequestTarget target) {
                if(modal.getTextUsuarioValor().equals("")){
                    target.appendJavaScript("inlineMsg($('#"+modal.getTxtusuariobdMarkupId()+"'),'Debe Colocar el Usuario de la Conexion a la Base de Datos.');");
                }else if(modal.getTextClaveUsuarioValor().equals("")){
                    target.appendJavaScript("inlineMsg($('#"+modal.getTxtclavesuariobdMarkupId()+"'),'Debe Colocar la Clave Usuario de la Conexion a la Base de Datos.');");
                }else{
                    inputStream = ConfigurarOpciones.class.getClassLoader().getResourceAsStream(conf_archivo);
                    if (inputStream != null) {
                        try {
                            prop.load(inputStream);
                            inputStream.close();
                            
                            prop.setProperty("bd.nombre","xx");
                            prop.setProperty("bd.urljdbc","jdbc.xx.xx");
                            prop.setProperty("bd.usuario",modal.getTextUsuarioValor());
                            prop.setProperty("bd.clave",modal.getTextClaveUsuarioValor());
                            FileOutputStream out = new FileOutputStream(new File(getClass().getClassLoader().getResource(conf_archivo).toURI()));
                            //System.out.println(getClass().getClassLoader().getResource(conf_archivo).toURI());
                            prop.store(out, "ERP CONFIGURADO");
                            out.close();
                        } catch (IOException ex) {
                            Logger.getLogger(ConfigurarOpciones.class.getName()).log(Level.SEVERE, null, ex);
                        } catch (URISyntaxException ex) {
                            Logger.getLogger(ConfigurarOpciones.class.getName()).log(Level.SEVERE, null, ex);
                        } 
                    }
                    modal.appendCloseDialogJavaScript(target);
                }               
            }
        });
        modal.addButton(new AjaxLink<String>("button", Model.of(getSesionSIS().getValorBundleLocaleIdioma("inicio.configurar.boton.cerrar"))) {
            @Override
            protected void onConfigure() {
                super.onConfigure();
                setBody(getDefaultModel());                
            }
            @Override
            public void onClick(AjaxRequestTarget art) {
                modal.appendCloseDialogJavaScript(art);
            }
        });
        add(modal);
        
        
        AjaxLink configurarERP=new AjaxLink("configurarERP") {            
            @Override
            public void onClick(AjaxRequestTarget art) {                
                modal.show(art);
            }
        };
        configurarERP.add(new Label("lblconfigurarERP", Model.of("Configurar ERP")));
        add(configurarERP);
        
        
        
    }
}
