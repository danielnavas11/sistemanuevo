package com.app.docag.sis;
import com.sis.persistencia.dao.pojos.Usuario;
import java.util.ResourceBundle;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.wicket.authroles.authentication.AuthenticatedWebSession;
import org.apache.wicket.authroles.authorization.strategies.role.Roles;
import org.apache.wicket.request.Request;
/**
 *
 * @author Daniel Navas
 */
public class WebSesion extends AuthenticatedWebSession {
    private Usuario usuario;
    
    public WebSesion(Request request) {
        super(request);
    }

    @Override
    public boolean authenticate(String username, String password) {
        boolean logeado=false;
        try{
            setUsuario(Aplicacion.get().getInicioSesion().getUsuarioLogin(username, username));
            System.out.println("usuario:"+getUsuario().getLogeado());
            logeado=getUsuario().getLogeado();
        } catch (Exception ex) {
            ex.printStackTrace();
            logeado=false;
        }
        return logeado;
    }
    
    @Override
    public void signOut() {
        super.signOut();
    }

    @Override
    public Roles getRoles() {
        System.out.println("com.app.docag.sis.WebSesion.getRoles():"+this.usuario);
        if (isSignedIn()){
            return new Roles(Roles.ADMIN);
        }
        return null;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
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
