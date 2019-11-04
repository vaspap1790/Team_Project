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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author vasil
 */
@Entity
@Table(name = "thingsToDo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ThingsToDo.findAll", query = "SELECT t FROM ThingsToDo t")
    , @NamedQuery(name = "ThingsToDo.findByThingsToDoid", query = "SELECT t FROM ThingsToDo t WHERE t.thingsToDoid = :thingsToDoid")
    , @NamedQuery(name = "ThingsToDo.findByDate", query = "SELECT t FROM ThingsToDo t WHERE t.date = :date")})
public class ThingsToDo implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "thingsToDo_id")
    private Integer thingsToDoid;
    @Lob
    @Size(max = 65535)
    @Column(name = "this")
    private String this1;
    @Column(name = "date")
    @Temporal(TemporalType.DATE)
    private Date date;
    @JoinColumn(name = "trip_id", referencedColumnName = "trip_id")
    @ManyToOne(optional = false)
    private Trip tripId;

    public ThingsToDo() {
    }

    public ThingsToDo(Integer thingsToDoid) {
        this.thingsToDoid = thingsToDoid;
    }

    public Integer getThingsToDoid() {
        return thingsToDoid;
    }

    public void setThingsToDoid(Integer thingsToDoid) {
        this.thingsToDoid = thingsToDoid;
    }

    public String getThis1() {
        return this1;
    }

    public void setThis1(String this1) {
        this.this1 = this1;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
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
        hash += (thingsToDoid != null ? thingsToDoid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ThingsToDo)) {
            return false;
        }
        ThingsToDo other = (ThingsToDo) object;
        if ((this.thingsToDoid == null && other.thingsToDoid != null) || (this.thingsToDoid != null && !this.thingsToDoid.equals(other.thingsToDoid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mainpackage.tripPlan.model.ThingsToDo[ thingsToDoid=" + thingsToDoid + " ]";
    }
    
}
