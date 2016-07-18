package com.app.docag.sis;
import com.sis.persistencia.dao.pojos.Usuario;
import java.util.ResourceBundle;
import org.apache.wicket.RestartResponseAtInterceptPageException;
import org.apache.wicket.authroles.authentication.AuthenticatedWebSession;
import org.apache.wicket.authroles.authorization.strategies.role.Roles;
import org.apache.wicket.request.Request;
/**
 *
 * @author Daniel Navas
 */
public class WebSesion extends AuthenticatedWebSession {
    private Usuario usuario;
    final static org.apache.log4j.Logger log_erp = org.apache.log4j.Logger.getLogger(WebSesion.class);
    public WebSesion(Request request) {
        super(request);
    }

    @Override
    public boolean authenticate(String username, String password) {
        boolean logeado;
        try{
            setUsuario(Aplicacion.get().getInicioSesion().getUsuarioLogin(username, password));
            log_erp.info("usuario:"+getUsuario().getLogeado());
            logeado=getUsuario().getLogeado();
        } catch (Exception ex) {
            logeado=false;
            log_erp.error(ex.getMessage(),ex);
        }
        return logeado;
    }
    
    @Override
    public void signOut() {
        setUsuario(null);
        super.signOut();
    }

    @Override
    public Roles getRoles() {
        if(!AuthenticatedWebSession.get().isSignedIn()){
            throw new RestartResponseAtInterceptPageException(new Inicio());
        }
        log_erp.info("getRoles:"+getUsuario().getId_usuario());
        if (isSignedIn() && getUsuario().getId_usuario()==1){
            return new Roles(Roles.USER);
        }else if(isSignedIn() && getUsuario().getId_usuario()==2){
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
        } catch (Exception ex) {
            log_erp.error(ex.getMessage(),ex);
            return etiqueta;
        }
    }
}
