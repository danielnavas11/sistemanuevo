package com.app.docag.sis;
import java.util.ResourceBundle;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.wicket.authroles.authentication.AuthenticatedWebSession;
import org.apache.wicket.authroles.authorization.strategies.role.Roles;
import org.apache.wicket.injection.Injector;
import org.apache.wicket.request.Request;
/**
 *
 * @author Daniel Navas
 */
public class WebSesion extends AuthenticatedWebSession {
    private HttpSession httpSession;
    //private SegUsuario usuario;
    
    
    
    public WebSesion(Request request) {
        super(request);
        this.httpSession = ((HttpServletRequest) request.getContainerRequest()).getSession();
        Injector.get().inject(this);
    }

    @Override
    public boolean authenticate(String username, String password) {
        //this.usuario = ERPAplicacion.get().getInicioSesion().getUsuarioLogin(usr.toLowerCase(), ERPCrypto.encriptaTexto(clv));
        
        return username.equals(password) && username.equals("demo");
    }
    
    @Override
    public void signOut() {
        super.signOut();
    }

    @Override
    public Roles getRoles() {
        if (isSignedIn()){
            return new Roles(Roles.ADMIN);
        }
        return null;
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
