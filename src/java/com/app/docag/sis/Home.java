package com.app.docag.sis;

import java.io.Serializable;

/**
 *
 * @author daniel
 */
public class Home extends PaginaWebSIS implements Serializable{
    private String userId;

   public Home(){
       System.out.println("getUserId:"+getSesionSIS().getAttribute("usuario"));
       System.out.println("getUserId:"+getSession().getAttribute("usuario"));
       System.out.println("getUserId:"+getUserId());
   }

   public String getUserId() {
     return userId;
   }

   public void setUserId(String userId) {
     this.userId = userId;
   }
}
