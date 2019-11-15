/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author vasil
 */
@Entity
@Table(name = "daily_budget")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DailyBudget.findAll", query = "SELECT d FROM DailyBudget d")
    , @NamedQuery(name = "DailyBudget.findById", query = "SELECT d FROM DailyBudget d WHERE d.id = :id")
    , @NamedQuery(name = "DailyBudget.findByDayBudget", query = "SELECT d FROM DailyBudget d WHERE d.dayBudget = :dayBudget")
    , @NamedQuery(name = "DailyBudget.findByDate", query = "SELECT d FROM DailyBudget d WHERE d.date = :date")})
public class DailyBudget implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "dayBudget")
    private BigDecimal dayBudget;
    @Column(name = "date")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date date;
    @JoinColumn(name = "tripId", referencedColumnName = "trip_id")
    @ManyToOne(optional = false)
    private Trip tripId;

    public DailyBudget() {
    }

    public DailyBudget(BigDecimal dayBudget, Date date, Trip tripId) {
        this.dayBudget = dayBudget;
        this.date = date;
        this.tripId = tripId;
    }
    
    

    public DailyBudget(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public BigDecimal getDayBudget() {
        return dayBudget;
    }

    public void setDayBudget(BigDecimal dayBudget) {
        this.dayBudget = dayBudget;
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
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DailyBudget)) {
            return false;
        }
        DailyBudget other = (DailyBudget) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mainpackage.tripPlan.model.DailyBudget[ id=" + id + " ]";
    }
    
}
