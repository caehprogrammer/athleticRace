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
public class participantsModel {
    private Integer pk_participant = null;
    private String fl_name = "";
    private String fl_patern_name = "";
    private String fl_matern_name = "";
    private String fl_mail = "";
    private String fl_cell_phone = "";
    private String fl_date_born = ""; 
    private int fl_age = 0;
    private int fl_gender = 0;
    private int fl_distance = 0;
    private String fl_category = "";
    private int  fl_competitor_number = 0;
    private int fl_ticket_number = 0;
    private String fl_date_register = "";
    private String fl_size_tshirt = "";
    private Integer fk_institution = 0;
    private String fl_observations = "";    
    
    public participantsModel() {
    }

    public participantsModel(Integer pk_participant, String fl_name, String fl_patern_name, String fl_matern_name, String fl_mail, String fl_cell_phone, String fl_date_born, int fl_age, int fl_gender, int fl_distance, String fl_category, int fl_competitor_number, int fl_ticket_number, String fl_date_register, String fl_size_tshirt, Integer fk_institution, String fl_observations) {
        this.pk_participant = pk_participant;
        this.fl_name = fl_name;
        this.fl_patern_name = fl_patern_name;
        this.fl_matern_name = fl_matern_name;
        this.fl_mail = fl_mail;
        this.fl_cell_phone = fl_cell_phone;
        this.fl_date_born = fl_date_born;
        this.fl_age = fl_age;
        this.fl_gender = fl_gender;
        this.fl_distance = fl_distance;
        this.fl_category = fl_category;
        this.fl_competitor_number = fl_competitor_number;
        this.fl_ticket_number = fl_ticket_number;
        this.fl_date_register = fl_date_register;
        this.fl_size_tshirt = fl_size_tshirt;
        this.fk_institution = fk_institution;
        this.fl_observations = fl_observations;
    }

    public Integer getPk_participant() {
        return pk_participant;
    }

    public void setPk_participant(Integer pk_participant) {
        this.pk_participant = pk_participant;
    }

    public String getFl_name() {
        return fl_name;
    }

    public void setFl_name(String fl_name) {
        this.fl_name = fl_name;
    }

    public String getFl_patern_name() {
        return fl_patern_name;
    }

    public void setFl_patern_name(String fl_patern_name) {
        this.fl_patern_name = fl_patern_name;
    }

    public String getFl_matern_name() {
        return fl_matern_name;
    }

    public void setFl_matern_name(String fl_matern_name) {
        this.fl_matern_name = fl_matern_name;
    }

    public String getFl_mail() {
        return fl_mail;
    }

    public void setFl_mail(String fl_mail) {
        this.fl_mail = fl_mail;
    }

    public String getFl_cell_phone() {
        return fl_cell_phone;
    }

    public void setFl_cell_phone(String fl_cell_phone) {
        this.fl_cell_phone = fl_cell_phone;
    }

    public String getFl_date_born() {
        return fl_date_born;
    }

    public void setFl_date_born(String fl_date_born) {
        this.fl_date_born = fl_date_born;
    }

    public int getFl_age() {
        return fl_age;
    }

    public void setFl_age(int fl_age) {
        this.fl_age = fl_age;
    }

    public int getFl_gender() {
        return fl_gender;
    }

    public void setFl_gender(int fl_gender) {
        this.fl_gender = fl_gender;
    }

    public int getFl_distance() {
        return fl_distance;
    }

    public void setFl_distance(int fl_distance) {
        this.fl_distance = fl_distance;
    }

    public String getFl_category() {
        return fl_category;
    }

    public void setFl_category(String fl_category) {
        this.fl_category = fl_category;
    }

    public int getFl_competitor_number() {
        return fl_competitor_number;
    }

    public void setFl_competitor_number(int fl_competitor_number) {
        this.fl_competitor_number = fl_competitor_number;
    }

    public int getFl_ticket_number() {
        return fl_ticket_number;
    }

    public void setFl_ticket_number(int fl_ticket_number) {
        this.fl_ticket_number = fl_ticket_number;
    }

    public String getFl_date_register() {
        return fl_date_register;
    }

    public void setFl_date_register(String fl_date_register) {
        this.fl_date_register = fl_date_register;
    }

    public String getFl_size_tshirt() {
        return fl_size_tshirt;
    }

    public void setFl_size_tshirt(String fl_size_tshirt) {
        this.fl_size_tshirt = fl_size_tshirt;
    }

    public Integer getFk_institution() {
        return fk_institution;
    }

    public void setFk_institution(Integer fk_institution) {
        this.fk_institution = fk_institution;
    }

    public String getFl_observations() {
        return fl_observations;
    }

    public void setFl_observations(String fl_observations) {
        this.fl_observations = fl_observations;
    }

    @Override
    public String toString() {
        return "participantModel{" + "pk_participant=" + pk_participant + ", fl_name=" + fl_name + ", fl_patern_name=" + fl_patern_name + ", fl_matern_name=" + fl_matern_name + ", fl_mail=" + fl_mail + ", fl_cell_phone=" + fl_cell_phone + ", fl_date_born=" + fl_date_born + ", fl_age=" + fl_age + ", fl_gender=" + fl_gender + ", fl_distance=" + fl_distance + ", fl_category=" + fl_category + ", fl_competitor_number=" + fl_competitor_number + ", fl_ticket_number=" + fl_ticket_number + ", fl_date_register=" + fl_date_register + ", fl_size_tshirt=" + fl_size_tshirt + ", fk_institution=" + fk_institution + ", fl_observations=" + fl_observations + '}';
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 43 * hash + Objects.hashCode(this.pk_participant);
        hash = 43 * hash + Objects.hashCode(this.fl_name);
        hash = 43 * hash + Objects.hashCode(this.fl_patern_name);
        hash = 43 * hash + Objects.hashCode(this.fl_matern_name);
        hash = 43 * hash + Objects.hashCode(this.fl_mail);
        hash = 43 * hash + Objects.hashCode(this.fl_cell_phone);
        hash = 43 * hash + Objects.hashCode(this.fl_date_born);
        hash = 43 * hash + this.fl_age;
        hash = 43 * hash + this.fl_gender;
        hash = 43 * hash + Objects.hashCode(this.fl_category);
        hash = 43 * hash + this.fl_competitor_number;
        hash = 43 * hash + this.fl_ticket_number;
        hash = 43 * hash + Objects.hashCode(this.fl_date_register);
        hash = 43 * hash + Objects.hashCode(this.fl_size_tshirt);
        hash = 43 * hash + Objects.hashCode(this.fk_institution);
        hash = 43 * hash + Objects.hashCode(this.fl_observations);
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
        final participantsModel other = (participantsModel) obj;
        if (this.fl_age != other.fl_age) {
            return false;
        }
        if (this.fl_gender != other.fl_gender) {
            return false;
        }
        if (this.fl_distance != other.fl_distance) {
            return false;
        }
        if (this.fl_competitor_number != other.fl_competitor_number) {
            return false;
        }
        if (this.fl_ticket_number != other.fl_ticket_number) {
            return false;
        }
        if (!Objects.equals(this.fl_name, other.fl_name)) {
            return false;
        }
        if (!Objects.equals(this.fl_patern_name, other.fl_patern_name)) {
            return false;
        }
        if (!Objects.equals(this.fl_matern_name, other.fl_matern_name)) {
            return false;
        }
        if (!Objects.equals(this.fl_mail, other.fl_mail)) {
            return false;
        }
        if (!Objects.equals(this.fl_cell_phone, other.fl_cell_phone)) {
            return false;
        }
        if (!Objects.equals(this.fl_date_born, other.fl_date_born)) {
            return false;
        }
        if (!Objects.equals(this.fl_category, other.fl_category)) {
            return false;
        }
        if (!Objects.equals(this.fl_date_register, other.fl_date_register)) {
            return false;
        }
        if (!Objects.equals(this.fl_observations, other.fl_observations)) {
            return false;
        }
        if (!Objects.equals(this.pk_participant, other.pk_participant)) {
            return false;
        }
        if (!Objects.equals(this.fk_institution, other.fk_institution)) {
            return false;
        }
        return true;
    }
}
