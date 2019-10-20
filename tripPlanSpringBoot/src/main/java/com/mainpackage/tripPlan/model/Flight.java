package com.mainpackage.tripPlan.model;

import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;

public class Flight implements Serializable{

    private String originPlace;
    private String destinationPlace;   
    private Date outboundDate;     
  
    public Flight() {
    }

    @Override
    public String toString() {
        return "Flight{" + "originPlace=" + originPlace + ", destinationPlace=" + destinationPlace + ", outboundDate=" + outboundDate + '}';
    }

    public String getOriginPlace() {
        return originPlace;
    }

    public void setOriginPlace(String originPlace) {
        this.originPlace = originPlace;
    }

    public String getDestinationPlace() {
        return destinationPlace;
    }

    public void setDestinationPlace(String destinationPlace) {
        this.destinationPlace = destinationPlace;
    }

    public Date getOutboundDate() {
        return outboundDate;
    }

    public void setOutboundDate(Date outboundDate) {
        this.outboundDate = outboundDate;
    }


   

   
    
    
 


  
    
    
    
}
