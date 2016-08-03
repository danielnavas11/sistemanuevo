package com.app.bootstrap.util;

import java.io.Serializable;

/**
 * @author Daniel Navas
 */
public class IVDMensajesJGROWL implements Serializable {
    /**
     * Clase que permite enviar mensajes manuales a la consola
     * por medio de el plugin jGrowl para jQuery
     * @author Daniel Navas
     */
    public static class ERPJGrowl implements Serializable {
        /**
         * Arma una funcion de tipo info (verde) para ejecutarla en un contexto Ajax
         * Wicket
         * @param mensaje   El mensaje que se desea desplegar
         * @param duracion  Duración en milisegundos
         * @return          String de la función jGrowl
         */
        public static String info(String mensaje, long duracion) {
            final StringBuilder jGrowl_texto = new StringBuilder();
            jGrowl_texto.append("$.growl(\"").append(mensaje).append('\"');
            jGrowl_texto.append(", {");
            jGrowl_texto.append("theme: \'jgrowl-").append("INFO").append("\'");
            jGrowl_texto.append(", life: " + duracion);
            jGrowl_texto.append("}");
            jGrowl_texto.append(");");
            return jGrowl_texto.toString();

        }
        /**
         * Arma una funcion de tipo info (verde) para ejecutarla en un contexto Ajax
         * Wicket de manera que sea necesario cerrarla explícitamente por parte
         * del usuario
         * @param mensaje   El mensaje que se desea desplegar
         * @return          String de la función jGrowl
         */
        public static String info(String mensaje) {
            final StringBuilder jGrowl_texto = new StringBuilder();
            /*jGrowl_texto.append("$.growl(\"").append(mensaje).append('\"');
            jGrowl_texto.append(", {");
            jGrowl_texto.append("theme: \'jgrowl-").append("INFO").append("\'");
            jGrowl_texto.append(", sticky: true");
            jGrowl_texto.append("}");
            jGrowl_texto.append(");");*/
            jGrowl_texto.append("info('").append(mensaje).append("');");
            return jGrowl_texto.toString();

        }

        /**
         * Arma una funcion de tipo error (roja) para ejecutarla en un contexto Ajax
         * Wicket de manera que sea necesario cerrarla explícitamente por parte
         * del usuario
         * @param mensaje   El mensaje que se desea desplegar
         * @return          String de la función jGrowl
         */
        public static String error(String mensaje) {
            final StringBuilder jGrowl_texto = new StringBuilder();

            jGrowl_texto.append("$.growl(\"").append(mensaje).append('\"');
            jGrowl_texto.append(", {");
            jGrowl_texto.append("theme: \'jgrowl-").append("ERROR").append("\'");
            jGrowl_texto.append(", sticky: true");
            jGrowl_texto.append("}");
            jGrowl_texto.append(");");
            return jGrowl_texto.toString();
        }

        /**
         * Arma una funcion de tipo error (roja) para ejecutarla en un contexto Ajax
         * Wicket
         * @param mensaje   El mensaje que se desea desplegar
         * @param duracion  Duración en milisegundos
         * @return          String de la función jGrowl
         */
        public static String error(String mensaje, long duracion) {
            final StringBuilder jGrowl_texto = new StringBuilder();

            jGrowl_texto.append("$.growl(\"").append(mensaje).append('\"');
            jGrowl_texto.append(", {");
            jGrowl_texto.append("theme: \'jgrowl-").append("ERROR").append("\'");
            jGrowl_texto.append(", life: " + duracion);
            jGrowl_texto.append("}");
            jGrowl_texto.append(");");
            return jGrowl_texto.toString();
        }

        /**
         * Arma una funcion de tipo warning (naranja) para ejecutarla en un contexto Ajax
         * Wicket de manera que sea necesario cerrarla explícitamente por parte
         * del usuario
         * @param mensaje   El mensaje que se desea desplegar
         * @return          String de la función jGrowl
         */
        public static String warn(String mensaje) {
            final StringBuilder jGrowl_texto = new StringBuilder();
            jGrowl_texto.append("notify('"+mensaje+"','top', 'right', 'fa fa-comments', 'danger','animated rotateInDownRight','animated rotateOutUpRight');");
            return jGrowl_texto.toString();
        }

        /**
         * Arma una funcion de tipo warning (naranja) para ejecutarla en un contexto Ajax
         * Wicket
         * @param mensaje   El mensaje que se desea desplegar
         * @param duracion  Duración en milisegundos
         * @return          String de la función jGrowl
         */
        public static String warn(String mensaje, long duracion) {
            final StringBuilder jGrowl_texto = new StringBuilder();
            jGrowl_texto.append("notify('"+mensaje+"','top', 'right', 'fa fa-comments', 'danger','animated rotateInDownRight','animated rotateOutUpRight');");
            return jGrowl_texto.toString();
        }
        
        /**
         * Arma una funcion de tipo warning (naranja) para ejecutarla en un contexto Ajax
         * Wicket de manera que sea necesario cerrarla explícitamente por parte
         * del usuario
         * @param mensaje   El mensaje que se desea desplegar
         * @return          String de la función jGrowl
         */
        public static String errorlogin(String mensaje) {
            final StringBuilder jGrowl_texto = new StringBuilder();
            jGrowl_texto.append("errorlogin('"+mensaje+"');");
            return jGrowl_texto.toString();
        }
    }
}
