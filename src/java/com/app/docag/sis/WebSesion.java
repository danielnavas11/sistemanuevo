package com.app.docag.sis;
import java.util.ResourceBundle;
import org.apache.wicket.authroles.authentication.AuthenticatedWebSession;
import org.apache.wicket.authroles.authorization.strategies.role.Roles;
import org.apache.wicket.request.Request;
/**
 *
 * @author Daniel Navas
 */
public class WebSesion extends AuthenticatedWebSession {

    public WebSesion(Request request) {
        super(request);
    }

    @Override
    public boolean authenticate(String string, String string1) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Roles getRoles() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public String getValorBundleLocaleIdioma(String etiqueta) {
        try {
            String valor = ResourceBundle.getBundle("com.app.docag.sis.lenguajes.Aplicacion", getLocale()).getString(etiqueta);
            return valor.equals("") ? etiqueta : valor;
        } catch (Exception e) {
            return etiqueta;
        }
    }
}
