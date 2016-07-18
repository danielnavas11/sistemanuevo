package com.app.bootstrap.util;

import java.util.HashMap;
import java.util.Map;
import org.apache.wicket.ajax.markup.html.navigation.paging.AjaxPagingNavigator;
import org.apache.wicket.markup.html.link.AbstractLink;
import org.apache.wicket.markup.html.navigation.paging.IPageable;
import org.apache.wicket.markup.html.navigation.paging.IPagingLabelProvider;
import org.apache.wicket.markup.html.navigation.paging.PagingNavigation;

/**
 *
 * @author daniel
 */
public class IVDAjaxPagingNavigator extends AjaxPagingNavigator{
    PagingNavigation currentNavigation = null;
    Map<String, AbstractLink> firstLastMap = new HashMap();
    Map<String, AbstractLink> prevNextMap = new HashMap();
    
    
    public IVDAjaxPagingNavigator(final String id,final IPageable pageable) {
        super(id, pageable, null);
    }
    
    public IVDAjaxPagingNavigator(final String id,final IPageable pageable,final IPagingLabelProvider labelProvider) {
        super(id, pageable, labelProvider);
    }
 }
