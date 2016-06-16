/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.app.bootstrap.util;

import org.apache.wicket.util.io.IClusterable;

/**
 *
 * @author Daniel Navas
 */
public interface ICssClassNameProvider extends IClusterable {
    String cssClassName();
}