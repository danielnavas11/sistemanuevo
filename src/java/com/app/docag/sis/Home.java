package com.app.docag.sis;

import java.io.Serializable;

/**
 *
 * @author daniel
 */
public class Home extends PaginaWebSIS implements Serializable {

    private String userId,userClave;

    public Home() {
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
