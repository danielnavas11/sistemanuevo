package com.app.docag.sis;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import org.apache.log4j.Logger;

/**
 *
 * @author Daniel Navas
 */
public abstract class Configurar {
    final static Logger log_erp = Logger.getLogger(Configurar.class);
    static InputStream inputStream;
    static Properties prop = new Properties();
    static String conf_archivo = "com/app/docag/configurar.properties";
    static boolean respuesta=false;
    public Configurar() {        
       
    }
    
    public static String obtenerParametrosConfiguracion(){
        String configuracion="";
         try {
            inputStream = Configurar.class.getClassLoader().getResourceAsStream(conf_archivo);
            if (inputStream != null) {
                prop.load(inputStream);
                configuracion+="\n\t\t\t\t\t- bd.nombre:".concat(prop.getProperty("bd.nombre").concat("\n"));
                configuracion+="\t\t\t\t\t- bd.urljdbc:".concat(prop.getProperty("bd.urljdbc").concat("\n"));
                configuracion+="\t\t\t\t\t- bd.usuario:".concat(prop.getProperty("bd.usuario"));
                inputStream.close();
            }             
        } catch (IOException e) {
            log_erp.fatal("Archivo de Configuracion '" + conf_archivo + "' no existe.",e);
            configuracion="----------Por Definir-----------";
        }
        return configuracion;
    }
    public static boolean ERPConfigurado(){         
        try {
            inputStream = Configurar.class.getClassLoader().getResourceAsStream(conf_archivo);
            if (inputStream != null) {
                prop.load(inputStream);
                respuesta=Boolean.parseBoolean(prop.getProperty("configurar"));
                inputStream.close();
            }             
        } catch (IOException e) {
            log_erp.fatal("Archivo de Configuracion '" + conf_archivo + "' no existe.",e);
            respuesta=false;
        }
        return respuesta;
    }
}
