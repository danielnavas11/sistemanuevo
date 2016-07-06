package com.app.docag.sis;

import com.sis.persistencia.dao.pojos.Usuario;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.panel.Panel;

/**
 * @author dnavas
 */
public class HeaderPanel extends Panel{    
    public HeaderPanel(String id,Usuario user,WebSesion getSesionSIS) {
        super(id);
        add(new Label("tituloLogo",getSesionSIS.getValorBundleLocaleIdioma("titulosistema")));
        String html="<a aria-expanded=\"false\" data-toggle=\"dropdown\" href=\"\">\n" +
"                        <i class=\"him-icon zmdi zmdi-notifications\"></i>\n" +
"                        <i class=\"him-counts\">1</i>\n" +
"                    </a>";
        html=html.concat("<div class=\"dropdown-menu dropdown-menu-lg pull-right\">\n" +
"                        <div class=\"list-group him-notification\">\n" +
"                            <div class=\"lg-header\">\n" +
"                                Notification\n" +
"                                <ul class=\"actions\">\n" +
"                                    <li class=\"dropdown\">\n" +
"                                        <a href=\"\" data-ma-action=\"clear-notification\" id=\"clear-notification\">\n" +
"                                            <i class=\"zmdi zmdi-check-all\"></i>\n" +
"                                        </a>\n" +
"                                    </li>\n" +
"                                </ul>\n" +
"                            </div>\n" +
"                            <div class=\"lg-body\">\n" +
"                                <a class=\"list-group-item media\" href=\"\">\n" +
"                                    <div class=\"pull-left\">\n" +
"                                        <img class=\"lgi-img\" src=\"\" alt=\"\">\n" +
"                                    </div>\n" +
"                                    <div class=\"media-body\">\n" +
"                                        <div class=\"lgi-heading\">Nueva Actualizaci&oacute;n en Modulo Equipos</div>\n" +
"                                        <small class=\"lgi-text\">El proximo 23-07-2016, se actualizara el \nmodulo de equipos con nuevas \nmejoras y funciones.</small>\n" +
"                                    </div>\n" +
"                                </a>\n" +
"                            </div>\n" +
"                        </div>");
        add(new Label("notificaciones", html).setEscapeModelStrings(false));
    }
    
}
