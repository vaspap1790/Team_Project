package com.mainpackage.tripPlan.model;

import java.io.Serializable;
import java.sql.Date;

public class Flight implements Serializable {

   private String originPlace;
   private String destinationPlace;
   private Date outboundDate;
   private String type;

   public Flight() {
   }

   @Override
   public String toString() {
       return "Flight{" + "originPlace=" + originPlace + ", destinationPlace=" + destinationPlace + ", outboundDate=" + outboundDate + ", type=" + type + '}';
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



   public String getType() {
       return type;
   }

   public void setType(String type) {
       this.type = type;
   }
    }
