/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.DummyModels;

import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import java.util.Date;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@JsonPropertyOrder({"title", "body", "tripId", "date"})
public class DummyNotes {

    public String title;
    public String body;
    public int tripId;
    public Date date;

    public DummyNotes(String title, String body, int tripId, Date date) {
        this.title = title;
        this.body = body;
        this.tripId = tripId;
        this.date = date;
    }

    @Override
    public String toString() {
        return "DummyNotes{" + "title=" + title + ", body=" + body + ", tripId=" + tripId + ", date=" + date + '}';
    }

}
