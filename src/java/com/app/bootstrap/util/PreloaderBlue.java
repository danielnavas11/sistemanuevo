package com.app.bootstrap.util;

import java.io.Serializable;

/**
 * @author Daniel Navas
 */
public class PreloaderBlue implements Serializable{
    
    public static class Circular implements Serializable {
        public static String mostrar() {
            final StringBuilder loader = new StringBuilder();
            loader.append("<!-- Page Loader -->\n" +
                            "        <div class=\"loader\">\n" +
                            "            <div class=\"preloader pls-blue\">\n" +
                            "                <svg class=\"pl-circular\" viewBox=\"25 25 50 50\">\n" +
                            "                    <circle class=\"plc-path\" cx=\"50\" cy=\"50\" r=\"20\" />\n" +
                            "                </svg>\n" +
                            "            </div>\n" +
                            "        </div>\n" +
                            "    <!-- Fin Page Loader -->");
            return loader.toString();
        }
    }
    
    public static class Progress implements Serializable {
        public static String mostrar() {
            final StringBuilder loader = new StringBuilder();
            loader.append("<div class=\"progress progress-striped active\">\n" +
                    "        <div style=\"width: 65%;\" aria-valuemax=\"100\" aria-valuemin=\"0\" aria-valuenow=\"45\" role=\"progressbar\" class=\"progress-bar\">\n" +
                    "            <span class=\"sr-only\">45% Complete</span>\n" +
                    "        </div>\n" +
                    "    </div>");
            return loader.toString();
        }
    }
}
