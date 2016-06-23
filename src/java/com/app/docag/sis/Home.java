package com.app.docag.sis;

import java.io.Serializable;
import org.apache.wicket.markup.html.image.Image;
import org.apache.wicket.request.resource.PackageResourceReference;

/**
 *
 * @author daniel
 */
public class Home extends PaginaWebSIS implements Serializable {

    private String userId,userClave;

    public Home() {
        add(new Image("avatarPerfil",new PackageResourceReference(imagenes.Imagenes.class, "perfil1.jpg")));
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
    }
}
