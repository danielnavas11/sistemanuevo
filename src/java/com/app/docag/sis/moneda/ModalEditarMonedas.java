package com.app.docag.sis.moneda;

import com.app.bootstrap.modal.ModalBootstrap;
import com.app.docag.sis.WebSesion;
import com.sis.persistencia.dao.pojos.Moneda;
import java.io.Serializable;
import org.apache.wicket.MarkupContainer;
import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.form.OnChangeAjaxBehavior;
import org.apache.wicket.markup.html.WebMarkupContainer;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.Model;
import org.apache.wicket.model.PropertyModel;
import org.apache.wicket.util.lang.Objects;

/**
 * @author daniel
 */
public class ModalEditarMonedas extends ModalBootstrap implements Serializable {

    /**
     * Objeto enviado por parámetro
     */
    private Moneda moneda;
    Form editarform;
    private MarkupContainer contenido;
    TextField<String>  txtmonedanombre;
    String txtmoneda_valor;
    Object obj;
    Label lblmoneda;

    public WebSesion getSesion() {
        return (WebSesion) getSession();
    }

    public ModalEditarMonedas(String id) {
        super(id);
    }

    public ModalEditarMonedas(String id, Object obj) {
        super(id);
        contenido = new WebMarkupContainer("contentMonedas");
        contenido.setOutputMarkupId(true);
        editarform = new Form("EditarMonedas");
        lblmoneda = new Label("EditarMonedasId", "");
        lblmoneda.setOutputMarkupId(true);
        editarform.add(lblmoneda);

        txtmonedanombre = new TextField<String>("EditarMonedasNombre", new PropertyModel<String>(this, "txtmoneda_valor"));
        txtmonedanombre.setOutputMarkupId(true);
        txtmonedanombre.add(new OnChangeAjaxBehavior() {
            @Override
            protected void onUpdate(AjaxRequestTarget art) {
                txtmoneda_valor = Objects.stringValue(((TextField<String>) getComponent()).getInput(), true);
                art.add(txtmonedanombre.setDefaultModel(Model.of(txtmoneda_valor)));
            }

        });

        editarform.add(txtmonedanombre);
        contenido.add(editarform);
        add(contenido);
    }

    public void setearMoneda(Object obj) {
        setOutputMarkupId(true);
        moneda = (Moneda) obj;
        lblmoneda.setDefaultModel(Model.of("" + moneda.getId_moneda()));
        txtmonedanombre.setDefaultModel(Model.of(moneda.getMoneda()));
        setTxtmoneda_valor("" + moneda.getMoneda());
    }

    public Moneda getMoneda() {
        return moneda;
    }

    public void setMoneda(Moneda moneda) {
        this.moneda = moneda;
    }

    public TextField<String> getTxtmonedanombre() {
        return txtmonedanombre;
    }

    public void setTxtmonedanombre(TextField<String> txtmonedanombre) {
        this.txtmonedanombre = txtmonedanombre;
    }

    public String getTxtmoneda_valor() {
        return txtmoneda_valor;
    }

    public void setTxtmoneda_valor(String txtmoneda_valor) {
        this.txtmoneda_valor = txtmoneda_valor;
    }

    
    
    @Override
    public ModalBootstrap addCloseButton() {
        return super.addCloseButton();
    }

    @Override
    public ModalBootstrap header(IModel label) {
        return super.header(label);
    }

    @Override
    public void setTitulo(String titulo) {
        super.setTitulo(titulo);
    }

    @Override
    public ModalBootstrap addCloseButton(IModel label) {
        return super.addCloseButton(label);
    }

    @Override
    public ModalBootstrap show(boolean show) {
        return super.show(show);
    }

    @Override
    public ModalBootstrap show(AjaxRequestTarget target) {
        return super.show(target);
    }

    @Override
    public ModalBootstrap setHeaderVisible(boolean visible) {
        return super.setHeaderVisible(visible);
    }

}
