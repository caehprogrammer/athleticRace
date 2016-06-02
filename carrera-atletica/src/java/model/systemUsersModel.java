/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Objects;

/**
 *
 * @author Lab5-E
 */
public class systemUsersModel {
    Integer pk_user;
    String fl_user_name;
    String fl_password;
    
    public systemUsersModel(){
        
    }
    
    public systemUsersModel(Integer pk_user, String fl_user_name, String fl_password) {
        this.pk_user = pk_user;
        this.fl_user_name = fl_user_name;
        this.fl_password = fl_password;
    }

    public Integer getPk_user() {
        return pk_user;
    }

    public void setPk_user(Integer pk_user) {
        this.pk_user = pk_user;
    }

    public String getFl_user_name() {
        return fl_user_name;
    }

    public void setFl_user_name(String fl_user_name) {
        this.fl_user_name = fl_user_name;
    }

    public String getFl_password() {
        return fl_password;
    }

    public void setFl_password(String fl_password) {
        this.fl_password = fl_password;
    }

    @Override
    public String toString() {
        return "systemUsersModel{" + "pk_user=" + pk_user + ", fl_user_name=" + fl_user_name + ", fl_password=" + fl_password + '}';
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 89 * hash + Objects.hashCode(this.pk_user);
        hash = 89 * hash + Objects.hashCode(this.fl_user_name);
        hash = 89 * hash + Objects.hashCode(this.fl_password);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final systemUsersModel other = (systemUsersModel) obj;
        if (!Objects.equals(this.fl_user_name, other.fl_user_name)) {
            return false;
        }
        if (!Objects.equals(this.fl_password, other.fl_password)) {
            return false;
        }
        if (!Objects.equals(this.pk_user, other.pk_user)) {
            return false;
        }
        return true;
    }
}
