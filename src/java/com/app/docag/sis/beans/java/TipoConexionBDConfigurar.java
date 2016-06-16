package com.app.docag.sis.beans.java;

import java.io.Serializable;

/**
 *
 * @author Daniel Navas
 */
public class TipoConexionBDConfigurar implements Serializable{
    private Integer id_tipo_conexcion;
    private String descripcion;

    public Integer getId_tipo_conexcion() {
        return id_tipo_conexcion;
    }

    public void setId_tipo_conexcion(Integer id_tipo_conexcion) {
        this.id_tipo_conexcion = id_tipo_conexcion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
}
