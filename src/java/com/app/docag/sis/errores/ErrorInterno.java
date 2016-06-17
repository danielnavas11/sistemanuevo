/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.app.docag.sis.errores;

import javax.servlet.http.HttpServletResponse;
import org.apache.wicket.markup.html.WebPage;
import org.apache.wicket.request.http.WebResponse;

/**
 *
 * @author Daniel Navas
 */
public final class ErrorInterno extends WebPage{
    public ErrorInterno() {
    }

    @Override
    protected void configureResponse(WebResponse response) {
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        super.configureResponse(response);
    }
    
    @Override
    public boolean isErrorPage() {
        return true;
    }

    @Override
    public boolean isVersioned() {
        return false;
    }
}
