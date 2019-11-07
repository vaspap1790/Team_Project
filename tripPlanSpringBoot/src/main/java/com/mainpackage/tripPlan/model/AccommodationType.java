/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author vasil
 */
@Entity
@Table(name = "accommodation_type")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AccommodationType.findAll", query = "SELECT a FROM AccommodationType a")
    , @NamedQuery(name = "AccommodationType.findByAccommoId", query = "SELECT a FROM AccommodationType a WHERE a.accommoId = :accommoId")
    , @NamedQuery(name = "AccommodationType.findByType", query = "SELECT a FROM AccommodationType a WHERE a.type = :type")})
public class AccommodationType implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "accommo_id")
    private Integer accommoId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 6)
    @Column(name = "type")
    private String type;

    public AccommodationType() {
    }

    public AccommodationType(Integer accommoId) {
        this.accommoId = accommoId;
    }

    public AccommodationType(Integer accommoId, String type) {
        this.accommoId = accommoId;
        this.type = type;
    }

    public Integer getAccommoId() {
        return accommoId;
    }

    public void setAccommoId(Integer accommoId) {
        this.accommoId = accommoId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (accommoId != null ? accommoId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AccommodationType)) {
            return false;
        }
        AccommodationType other = (AccommodationType) object;
        if ((this.accommoId == null && other.accommoId != null) || (this.accommoId != null && !this.accommoId.equals(other.accommoId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mainpackage.tripPlan.model.AccommodationType[ accommoId=" + accommoId + " ]";
    }
    
}
