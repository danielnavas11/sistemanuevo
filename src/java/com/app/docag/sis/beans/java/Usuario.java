package com.app.docag.sis.beans.java;

import java.util.Date;

/**
 *
 * @author Daniel Navas
 */
public class Usuario {
    private Integer id_idioma;
    private Integer id_usuario;
    private Integer id_area;
    private Integer id_cargo;
    private Integer id_cargo_digitalizacion;
    private Integer id_parroquia;
    private Integer tlf;
    private Integer id_grupo;
    private String apellidos;
    private String usuario;
    private String clave;
    private String nombres;
    private String correo;
    private Date fecha_registro;
    private Date fecha_ultima_clave;
    private Boolean administrador,activo,primera_vez;

    public Integer getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(Integer id_usuario) {
        this.id_usuario = id_usuario;
    }

    public Integer getId_area() {
        return id_area;
    }

    public void setId_area(Integer id_area) {
        this.id_area = id_area;
    }

    public Integer getId_cargo() {
        return id_cargo;
    }

    public void setId_cargo(Integer id_cargo) {
        this.id_cargo = id_cargo;
    }

    public Integer getId_cargo_digitalizacion() {
        return id_cargo_digitalizacion;
    }

    public void setId_cargo_digitalizacion(Integer id_cargo_digitalizacion) {
        this.id_cargo_digitalizacion = id_cargo_digitalizacion;
    }

    public Integer getId_parroquia() {
        return id_parroquia;
    }

    public void setId_parroquia(Integer id_parroquia) {
        this.id_parroquia = id_parroquia;
    }

    public Integer getTlf() {
        return tlf;
    }

    public void setTlf(Integer tlf) {
        this.tlf = tlf;
    }

    public Integer getId_idioma() {
        return id_idioma;
    }

    public void setId_idioma(Integer id_idioma) {
        this.id_idioma = id_idioma;
    }

    public Integer getId_grupo() {
        return id_grupo;
    }

    public void setId_grupo(Integer id_grupo) {
        this.id_grupo = id_grupo;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public Date getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(Date fecha_registro) {
        this.fecha_registro = fecha_registro;
    }

    public Date getFecha_ultima_clave() {
        return fecha_ultima_clave;
    }

    public void setFecha_ultima_clave(Date fecha_ultima_clave) {
        this.fecha_ultima_clave = fecha_ultima_clave;
    }

    public Boolean isPrimera_vez() {
        return primera_vez;
    }

    public void setPrimera_vez(Boolean primera_vez) {
        this.primera_vez = primera_vez;
    }

    public Boolean isActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }

    public Boolean isAdministrador() {
        return administrador;
    }

    public void setAdministrador(Boolean administrador) {
        this.administrador = administrador;
    }
    private Boolean logeado;

    public Boolean isLogeado() {
        return logeado;
    }

    public void setLogeado(Boolean logeado) {
        this.logeado = logeado;
    }
    
}
