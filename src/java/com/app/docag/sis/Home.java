package com.app.docag.sis;

import com.app.docag.sis.home.HomeSeccion1;
import java.io.Serializable;
import org.apache.wicket.Session;
import org.apache.wicket.behavior.AttributeAppender;
import org.apache.wicket.markup.html.WebMarkupContainer;
import org.apache.wicket.markup.html.image.Image;
import org.apache.wicket.request.cycle.RequestCycle;
import org.apache.wicket.request.resource.PackageResourceReference;

/**
 *
 * @author daniel
 */
public class Home extends PaginaWebSIS implements Serializable {

    private String userId,userClave;

    public Home() {
        System.out.println("getSesionSIS().isSignedIn():"+getSesionSIS().isSignedIn());
        System.out.println("username:"+Session.get().getAttribute("username"));
        System.out.println("username:"+getSession().get().getAttribute("username"));
        
        WebMarkupContainer modalheader = new WebMarkupContainer("headerpic");
	modalheader.add(new AttributeAppender("style","background: url('"+RequestCycle.get().urlFor(new PackageResourceReference(imagenes.Imagenes.class, "user-bg.jpg") , null).toString()+"');"));
	add(modalheader);
        
        add(modalheader.add(new Image("avatarPerfil",new PackageResourceReference(imagenes.Imagenes.class, "userIcon.png"))));
        add(new HomeSeccion1("HomeSeccion1"));
    }

    public String getUserId() {
        return userId;
    }
    
    public String getUserClave() {
        return userClave;
    }
    
    public void setUserClave(String userClave) {
        this.userClave = userClave;
        System.out.println("getUserClave:" + getUserClave());
    }

    public void setUserId(String userId) {
        this.userId = userId;
        
        System.out.println("getUserId:" + getUserId());
        System.out.println("getSesionSIS().isSignedIn():"+getSesionSIS().isSignedIn());
        System.out.println("username:"+Session.get().getAttribute("username"));
        
    }
}
