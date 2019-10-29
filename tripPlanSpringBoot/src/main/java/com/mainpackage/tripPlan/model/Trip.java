
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
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@Table(name = "trip")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Trip.findAll", query = "SELECT t FROM Trip t")
    , @NamedQuery(name = "Trip.findByTripId", query = "SELECT t FROM Trip t WHERE t.tripId = :tripId")
    , @NamedQuery(name = "Trip.findByTotalBudget", query = "SELECT t FROM Trip t WHERE t.totalBudget = :totalBudget")})
public class Trip implements Serializable {

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
    private Collection<Thingstodo> thingstodoCollection;
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    @ManyToOne(optional = false)
    private User userId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tripId")
    private Collection<Post> postCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tripId")
    private Collection<Photo> photoCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tripId")
    private Collection<Barrestaurant> barrestaurantCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tripId")
    private Collection<Comment> commentCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tripId")
    private Collection<Location> locationCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tripId")
    private Collection<Rental> rentalCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tripId")
    private Collection<Transportation> transportationCollection;

    public Trip() {
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
    public Collection<Thingstodo> getThingstodoCollection() {
        return thingstodoCollection;
    }

    public void setThingstodoCollection(Collection<Thingstodo> thingstodoCollection) {
        this.thingstodoCollection = thingstodoCollection;
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
    public Collection<Photo> getPhotoCollection() {
        return photoCollection;
    }

    public void setPhotoCollection(Collection<Photo> photoCollection) {
        this.photoCollection = photoCollection;
    }

    @XmlTransient
    public Collection<Barrestaurant> getBarrestaurantCollection() {
        return barrestaurantCollection;
    }

    public void setBarrestaurantCollection(Collection<Barrestaurant> barrestaurantCollection) {
        this.barrestaurantCollection = barrestaurantCollection;
    }

    @XmlTransient
    public Collection<Comment> getCommentCollection() {
        return commentCollection;
    }

    public void setCommentCollection(Collection<Comment> commentCollection) {
        this.commentCollection = commentCollection;
    }

    @XmlTransient
    public Collection<Location> getLocationCollection() {
        return locationCollection;
    }

    public void setLocationCollection(Collection<Location> locationCollection) {
        this.locationCollection = locationCollection;
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
    
}
