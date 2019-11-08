/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author vasil
 */
@Entity
@Table(name = "transportation_type")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TransportationType.findAll", query = "SELECT t FROM TransportationType t")
    , @NamedQuery(name = "TransportationType.findByTypeId", query = "SELECT t FROM TransportationType t WHERE t.typeId = :typeId")
    , @NamedQuery(name = "TransportationType.findByType", query = "SELECT t FROM TransportationType t WHERE t.type = :type")})
public class TransportationType implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "type_id")
    private Integer typeId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 8)
    @Column(name = "type")
    private String type;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "typeId")
    private Collection<Transportation> transportationCollection;

    public TransportationType() {
    }
    public TransportationType(String type) {
        this.type=type;
    }

    public TransportationType(Integer typeId) {
        this.typeId = typeId;
    }

    public TransportationType(Integer typeId, String type) {
        this.typeId = typeId;
        this.type = type;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @XmlTransient
    public Collection<Transportation> getTransportationCollection() {
        return transportationCollection;
    }

    public void setTransportationCollection(Collection<Transportation> transportationCollection) {
        this.transportationCollection = transportationCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (typeId != null ? typeId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TransportationType)) {
            return false;
        }
        TransportationType other = (TransportationType) object;
        if ((this.typeId == null && other.typeId != null) || (this.typeId != null && !this.typeId.equals(other.typeId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mainpackage.tripPlan.model.TransportationType[ typeId=" + typeId + " ]";
    }
    
}
