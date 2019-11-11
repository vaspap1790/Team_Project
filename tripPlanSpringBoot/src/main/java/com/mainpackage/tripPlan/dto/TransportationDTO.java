/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.dto;

import java.math.BigDecimal;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;


public class TransportationDTO {
    
    public String startingPoint;
    public String destination;
    public BigDecimal price;
    public String link;
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    public Date departure;
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    public Date arrival;

    public TransportationDTO(String startingPoint, String destination, BigDecimal price, String link, Date departure, Date arrival) {
        this.startingPoint = startingPoint;
        this.destination = destination;
        this.price = price;
        this.link = link;
        this.departure = departure;
        this.arrival = arrival;
    }

    public String getStartingPoint() {
        return startingPoint;
    }

    public String getDestination() {
        return destination;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public String getLink() {
        return link;
    }

    public Date getDeparture() {
        return departure;
    }

    public Date getArrival() {
        return arrival;
    }
    
    
}
