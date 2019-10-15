/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author vaspa
 */
@Entity
@Table(name = "transportation")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Transportation.findAll", query = "SELECT t FROM Transportation t")
    , @NamedQuery(name = "Transportation.findByTransportationId", query = "SELECT t FROM Transportation t WHERE t.transportationId = :transportationId")
    , @NamedQuery(name = "Transportation.findByTimestamp", query = "SELECT t FROM Transportation t WHERE t.timestamp = :timestamp")})
public class Transportation implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "transportation_id")
    private Integer transportationId;
    @Lob
    @Size(max = 65535)
    @Column(name = "this")
    private String this1;
    @Basic(optional = false)
    @NotNull
    @Column(name = "timestamp")
    @Temporal(TemporalType.TIMESTAMP)
    private Date timestamp;
    @JoinColumn(name = "trip_id", referencedColumnName = "trip_id")
    @ManyToOne(optional = false)
    private Trip tripId;

    public Transportation() {
    }

    public Transportation(Integer transportationId) {
        this.transportationId = transportationId;
    }

    public Transportation(Integer transportationId, Date timestamp) {
        this.transportationId = transportationId;
        this.timestamp = timestamp;
    }

    public Integer getTransportationId() {
        return transportationId;
    }

    public void setTransportationId(Integer transportationId) {
        this.transportationId = transportationId;
    }

    public String getThis1() {
        return this1;
    }

    public void setThis1(String this1) {
        this.this1 = this1;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }

    public Trip getTripId() {
        return tripId;
    }

    public void setTripId(Trip tripId) {
        this.tripId = tripId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (transportationId != null ? transportationId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Transportation)) {
            return false;
        }
        Transportation other = (Transportation) object;
        if ((this.transportationId == null && other.transportationId != null) || (this.transportationId != null && !this.transportationId.equals(other.transportationId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mainpackage.tripPlan.model.Transportation[ transportationId=" + transportationId + " ]";
    }
    
}
