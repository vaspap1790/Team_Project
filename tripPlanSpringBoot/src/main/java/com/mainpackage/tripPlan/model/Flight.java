package com.mainpackage.tripPlan.model;

import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;

public class Flight implements Serializable{

    private String country="US";
    private String currency="USD";
    private String locale="en-US";
    private String adults;  
    private String originPlace;
    private String destinationPlace;   
    private Date outboundDate;     
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

    public void setAdults(String adults) {
        this.adults = adults;
    }

    public void setOriginPlace(String originPlace) {
        this.originPlace = originPlace;
    }

    public void setDestinationPlace(String destinationPlace) {
        this.destinationPlace = destinationPlace;
    }

   

    public void setCabinClass(String cabinClass) {
        this.cabinClass = cabinClass;
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

    public String getAdults() {
        return adults;
    }

    public String getOriginPlace() {
        return originPlace;
    }

    public String getDestinationPlace() {
        return destinationPlace;
    }

    public Date getOutboundDate() {
        return outboundDate;
    }

  

    public void setOutboundDate(Date outboundDate) {
        this.outboundDate = outboundDate;
    }

   

 

    public String getCabinClass() {
        return cabinClass;
    }

    @Override
    public String toString() {
        return "Flight{" + "country=" + country + ", currency=" + currency + ", locale=" + locale + ", adults=" + adults + ", originPlace=" + originPlace + ", destinationPlace=" + destinationPlace + ", outboundDate=" + outboundDate + ", cabinClass=" + cabinClass + '}';
    }

   
    
    
 


  
    
    
    
}
