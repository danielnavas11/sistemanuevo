package com.app.docag.sis;           

import com.app.docag.sis.errores.ErrorInterno;
import java.io.Serializable;
import org.apache.log4j.Logger;
import org.apache.wicket.authroles.authentication.AbstractAuthenticatedWebSession;
import org.apache.wicket.authroles.authentication.AuthenticatedWebApplication;
import org.apache.wicket.markup.html.IPackageResourceGuard;
import org.apache.wicket.markup.html.SecurePackageResourceGuard;
import org.apache.wicket.markup.html.WebPage;
import org.apache.wicket.settings.ISecuritySettings;
import org.apache.wicket.spring.injection.annot.SpringComponentInjector;
import org.apache.wicket.util.crypt.AbstractCrypt;
import org.apache.wicket.util.crypt.ClassCryptFactory;
/** 
 *
 * @author Daniel Navas
 * @version 
 */

public class Aplicacion extends AuthenticatedWebApplication implements Serializable{
    final static Logger log_erp = Logger.getLogger(Aplicacion.class);
    public Aplicacion() {
    }

    public Class getHomePage() {
        return Inicio.class;
    }
    
    @Override
    protected void init() {
        super.init();
        //getApplicationSettings().setPageExpiredErrorPage(MyExpiredPage.class);
        //getApplicationSettings().setAccessDeniedPage(MyAccessDeniedPage.class);
        getApplicationSettings().setInternalErrorPage(ErrorInterno.class);
        
        getSecuritySettings().setCryptFactory(new ClassCryptFactory(AbstractCrypt.class,ISecuritySettings.DEFAULT_ENCRYPTION_KEY));
        
        getDebugSettings().setAjaxDebugModeEnabled(false);
        mountPage("/Inicio",Inicio.class); 
        getDebugSettings().setOutputComponentPath(true);
        getDebugSettings().setDevelopmentUtilitiesEnabled(true);

        getComponentInstantiationListeners().add(new SpringComponentInjector(this));
        
        IPackageResourceGuard packageResourceGuard = getResourceSettings().getPackageResourceGuard();
        if (packageResourceGuard instanceof SecurePackageResourceGuard){
            SecurePackageResourceGuard guard = (SecurePackageResourceGuard)packageResourceGuard;
            guard.addPattern("+*.map");
            guard.addPattern("+*.ttf");
            guard.addPattern("+*.woff");
            guard.addPattern("+*.woff2");
        } 
    }

    @Override
    protected Class<? extends AbstractAuthenticatedWebSession> getWebSessionClass() {
        return WebSesion.class;
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected Class<? extends WebPage> getSignInPageClass() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
