/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author vasil
 */
@Entity
@Table(name = "trip")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Trip.findAll", query = "SELECT t FROM Trip t")
    , @NamedQuery(name = "Trip.findByTripId", query = "SELECT t FROM Trip t WHERE t.tripId = :tripId")
    , @NamedQuery(name = "Trip.findByTotalBudget", query = "SELECT t FROM Trip t WHERE t.totalBudget = :totalBudget")})
public class Trip implements Serializable {

    @Size(max = 45)
    @Column(name = "location")
    private String location;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tripId")
    private Collection<DailyBudget> dailyBudgetCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tripId")
    private Collection<Notes> notesCollection;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "trip_id")
    private Integer tripId;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "total_budget")
    private BigDecimal totalBudget;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tripId")
    private Collection<Photo> photoCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tripId")
    private Collection<BarRestaurant> barRestaurantCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tripId")
    private Collection<Rental> rentalCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tripId")
    private Collection<Transportation> transportationCollection;
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    @ManyToOne(optional = false)
    private User userId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tripId")
    private Collection<Post> postCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tripId")
    private Collection<ThingsToDo> thingsToDoCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tripId")
    private Collection<Accommodation> accommodationCollection;

    public Trip() {
    }
    public Trip(String location) {
        this.location=location;
    }

    public Trip(Integer tripId) {
        this.tripId = tripId;
    }

    public Integer getTripId() {
        return tripId;
    }

    public void setTripId(Integer tripId) {
        this.tripId = tripId;
    }

    public BigDecimal getTotalBudget() {
        return totalBudget;
    }

    public void setTotalBudget(BigDecimal totalBudget) {
        this.totalBudget = totalBudget;
    }

    @XmlTransient
    public Collection<Photo> getPhotoCollection() {
        return photoCollection;
    }

    public void setPhotoCollection(Collection<Photo> photoCollection) {
        this.photoCollection = photoCollection;
    }

    @XmlTransient
    public Collection<BarRestaurant> getBarRestaurantCollection() {
        return barRestaurantCollection;
    }

    public void setBarRestaurantCollection(Collection<BarRestaurant> barRestaurantCollection) {
        this.barRestaurantCollection = barRestaurantCollection;
    }

    @XmlTransient
    public Collection<Rental> getRentalCollection() {
        return rentalCollection;
    }

    public void setRentalCollection(Collection<Rental> rentalCollection) {
        this.rentalCollection = rentalCollection;
    }

    @XmlTransient
    public Collection<Transportation> getTransportationCollection() {
        return transportationCollection;
    }

    public void setTransportationCollection(Collection<Transportation> transportationCollection) {
        this.transportationCollection = transportationCollection;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    @XmlTransient
    public Collection<Post> getPostCollection() {
        return postCollection;
    }

    public void setPostCollection(Collection<Post> postCollection) {
        this.postCollection = postCollection;
    }

    @XmlTransient
    public Collection<ThingsToDo> getThingsToDoCollection() {
        return thingsToDoCollection;
    }

    public void setThingsToDoCollection(Collection<ThingsToDo> thingsToDoCollection) {
        this.thingsToDoCollection = thingsToDoCollection;
    }

    @XmlTransient
    public Collection<Accommodation> getAccommodationCollection() {
        return accommodationCollection;
    }

    public void setAccommodationCollection(Collection<Accommodation> accommodationCollection) {
        this.accommodationCollection = accommodationCollection;
    }


    @Override
    public int hashCode() {
        int hash = 0;
        hash += (tripId != null ? tripId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Trip)) {
            return false;
        }
        Trip other = (Trip) object;
        if ((this.tripId == null && other.tripId != null) || (this.tripId != null && !this.tripId.equals(other.tripId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mainpackage.tripPlan.model.Trip[ tripId=" + tripId + " ]";
    }


    @XmlTransient
    public Collection<Notes> getNotesCollection() {
        return notesCollection;
    }

    public void setNotesCollection(Collection<Notes> notesCollection) {
        this.notesCollection = notesCollection;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @XmlTransient
    public Collection<DailyBudget> getDailyBudgetCollection() {
        return dailyBudgetCollection;
    }

    public void setDailyBudgetCollection(Collection<DailyBudget> dailyBudgetCollection) {
        this.dailyBudgetCollection = dailyBudgetCollection;
    }

}
