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
 * @author vaspa
 */
@Entity
@Table(name = "barrestaurant")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Barrestaurant.findAll", query = "SELECT b FROM Barrestaurant b")
    , @NamedQuery(name = "Barrestaurant.findByBarRestaurantid", query = "SELECT b FROM Barrestaurant b WHERE b.barRestaurantid = :barRestaurantid")
    , @NamedQuery(name = "Barrestaurant.findByDate", query = "SELECT b FROM Barrestaurant b WHERE b.date = :date")})
public class Barrestaurant implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "barRestaurant_id")
    private Integer barRestaurantid;
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

    public Barrestaurant() {
    }

    public Barrestaurant(Integer barRestaurantid) {
        this.barRestaurantid = barRestaurantid;
    }

    public Integer getBarRestaurantid() {
        return barRestaurantid;
    }

    public void setBarRestaurantid(Integer barRestaurantid) {
        this.barRestaurantid = barRestaurantid;
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
        hash += (barRestaurantid != null ? barRestaurantid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Barrestaurant)) {
            return false;
        }
        Barrestaurant other = (Barrestaurant) object;
        if ((this.barRestaurantid == null && other.barRestaurantid != null) || (this.barRestaurantid != null && !this.barRestaurantid.equals(other.barRestaurantid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mainpackage.tripPlan.model.Barrestaurant[ barRestaurantid=" + barRestaurantid + " ]";
    }
    
}
