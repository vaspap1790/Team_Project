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
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author vasil
 */
@Entity
@Table(name = "accommodation")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Accommodation.findAll", query = "SELECT a FROM Accommodation a")
    , @NamedQuery(name = "Accommodation.findById", query = "SELECT a FROM Accommodation a WHERE a.id = :id")
    , @NamedQuery(name = "Accommodation.findByLocation", query = "SELECT a FROM Accommodation a WHERE a.location = :location")
    , @NamedQuery(name = "Accommodation.findByPrice", query = "SELECT a FROM Accommodation a WHERE a.price = :price")
    , @NamedQuery(name = "Accommodation.findByAccommoName", query = "SELECT a FROM Accommodation a WHERE a.accommoName = :accommoName")
    , @NamedQuery(name = "Accommodation.findByCheckin", query = "SELECT a FROM Accommodation a WHERE a.checkin = :checkin")
    , @NamedQuery(name = "Accommodation.findByCheckout", query = "SELECT a FROM Accommodation a WHERE a.checkout = :checkout")})
public class Accommodation implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 30)
    @Column(name = "location")
    private String location;
    @Lob
    @Size(max = 65535)
    @Column(name = "this1")
    private String this1;
    @Column(name = "price")
    private Integer price;
    @Size(max = 30)
    @Column(name = "accommo_name")
    private String accommoName;
    @Column(name = "checkin",columnDefinition="DATETIME")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date checkin;
    @Column(name = "checkout",columnDefinition="DATETIME")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date checkout;
    @JoinColumn(name = "type_id", referencedColumnName = "accommo_id")
    @ManyToOne(optional = false)
    private AccommodationType typeId;
    @JoinColumn(name = "trip_id", referencedColumnName = "trip_id")
    @ManyToOne(optional = false)
    private Trip tripId;

    public Accommodation() {
    }

    public Accommodation(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getThis1() {
        return this1;
    }

    public void setThis1(String this1) {
        this.this1 = this1;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getAccommoName() {
        return accommoName;
    }

    public void setAccommoName(String accommoName) {
        this.accommoName = accommoName;
    }

    public Date getCheckin() {
        return checkin;
    }

    public void setCheckin(Date checkin) {
        this.checkin = checkin;
    }

    public Date getCheckout() {
        return checkout;
    }

    public void setCheckout(Date checkout) {
        this.checkout = checkout;
    }

    public AccommodationType getTypeId() {
        return typeId;
    }

    public void setTypeId(AccommodationType typeId) {
        this.typeId = typeId;
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
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Accommodation)) {
            return false;
        }
        Accommodation other = (Accommodation) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mainpackage.tripPlan.model.Accommodation[ id=" + id + " ]";
    }
    
}
