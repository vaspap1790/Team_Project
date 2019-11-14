/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.DummyModels;

import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

@JsonPropertyOrder({ "title", "body","tripId","date" })
public class DummyNotes {
    public String title;
    public String body;
    public int tripId;
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    public Date date;

    public DummyNotes(String title, String body, int tripId, Date date) {
        this.title = title;
        this.body = body;
        this.tripId = tripId;
        this.date = date;
    }

    public DummyNotes() {
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public int getTripId() {
        return tripId;
    }

    public void setTripId(int tripId) {
        this.tripId = tripId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "DummyNotes{" + "title=" + title + ", body=" + body + ", tripId=" + tripId + ", date=" + date + '}';
    }
    
      
}
