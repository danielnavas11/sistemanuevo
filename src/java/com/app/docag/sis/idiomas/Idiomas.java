package com.app.docag.sis.idiomas;

import com.app.bootstrap.util.IVDAjaxPagingNavigator;
import com.sis.persistencia.dao.pojos.Idioma;
import com.sis.persistencia.h.IdiomaH;
import java.util.ArrayList;
import java.util.List;
import org.apache.wicket.Component;
import org.apache.wicket.ajax.AjaxEventBehavior;
import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.panel.Panel;
import org.apache.wicket.markup.repeater.Item;
import org.apache.wicket.markup.repeater.RepeatingView;
import org.apache.wicket.markup.repeater.data.DataView;
import org.apache.wicket.markup.repeater.data.ListDataProvider;
import org.apache.wicket.model.IModel;
import org.apache.wicket.spring.injection.annot.SpringBean;

/**
 * @author daniel
 */
public class Idiomas extends Panel {
    private List<Idioma> listaIdiomas = new ArrayList<Idioma>();
    @SpringBean
    private IdiomaH idiomaImpl;
    
    public Idiomas(String id) {
        super(id);
        listaIdiomas=idiomaImpl.getAllIdiomas();
        System.out.println("listaIdiomas:"+listaIdiomas);
        ListDataProvider<Idioma> listDataProviderIdiomas = new ListDataProvider<Idioma>(listaIdiomas);
        DataView<Idioma> dataView = new DataView<Idioma>("rowsIdiomas", listDataProviderIdiomas) {
            @Override
            protected void populateItem(final Item<Idioma> item) {
                final Idioma idi = item.getModelObject();
                RepeatingView repeatingView = new RepeatingView("dataRowIdiomas");
                repeatingView.add(new Label(repeatingView.newChildId(), idi.getId_idioma()+""));
                repeatingView.add(new Label(repeatingView.newChildId(), idi.getSiglas()));
                repeatingView.add(new Label(repeatingView.newChildId(), idi.getIdioma()));
                Component lbl=new Label("dataRowEditar", "<button wicket:id=\"dataRowEditar\" type=\"button\" class=\"btnanimadocomandoedit btn btn-icon waves-effect command-edit waves-circle\" id=\"btnanimadocomandoedit\">\n" +
"                        <span class=\"zmdi zmdi-edit\"></span>\n" +
"                    </button>").setEscapeModelStrings(false);
                lbl.add(new AjaxEventBehavior("onclick") {
                    @Override
                    protected void onEvent(AjaxRequestTarget art) {
                         System.out.println("click "+idi.getId_idioma());
                    }
                });
                repeatingView.add(lbl);
                item.add(repeatingView); 
            }
        };
        dataView.setItemsPerPage(6);
        add(dataView);
        add(new IVDAjaxPagingNavigator("pagingNavigator", dataView));
    }
    
    public Idiomas(String id, IModel<?> model) {
        super(id, model);
    }
    
}
