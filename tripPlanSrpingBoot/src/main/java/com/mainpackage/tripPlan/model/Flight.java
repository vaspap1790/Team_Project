package com.mainpackage.tripPlan.model;

import java.io.Serializable;

public class Flight implements Serializable{

    private String country="US";
    private String currency="USD";
    private String locale="en-US";
    private int adults;  
    private String originPlace;
    private String destinationPlace;
    private String outboundDate;
    private String inboundDate;
    
    private int infants;
    private int children;
    private String cabinClass;
    public Flight() {
    }
    
    
    
    public void setCountry(String country) {
        this.country = country;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public void setLocale(String locale) {
        this.locale = locale;
    }

    public void setCabinClass(String cabinClass) {
        this.cabinClass = cabinClass;
    }

    public void setOriginPlace(String originPlace) {
        this.originPlace = originPlace;
    }

    public void setDestinationPlace(String destinationPlace) {
        this.destinationPlace = destinationPlace;
    }

    public void setOutboundDate(String outboundDate) {
        this.outboundDate = outboundDate;
    }

    public void setInboundDate(String inboundDate) {
        this.inboundDate = inboundDate;
    }

    public void setAdults(int adults) {
        this.adults = adults;
    }

    public void setInfants(int infants) {
        this.infants = infants;
    }

    public void setChildren(int children) {
        this.children = children;
    }

    public String getCountry() {
        return country;
    }

    public String getCurrency() {
        return currency;
    }

    public String getLocale() {
        return locale;
    }

    public String getCabinClass() {
        return cabinClass;
    }

    public String getOriginPlace() {
        return originPlace;
    }

    public String getDestinationPlace() {
        return destinationPlace;
    }

    public String getOutboundDate() {
        return outboundDate;
    }

    public String getInboundDate() {
        return inboundDate;
    }

    public int getAdults() {
        return adults;
    }

    public int getInfants() {
        return infants;
    }

    public int getChildren() {
        return children;
    }
    
    
    
}
