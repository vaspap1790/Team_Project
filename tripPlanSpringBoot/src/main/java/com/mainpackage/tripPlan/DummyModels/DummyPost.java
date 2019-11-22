/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.DummyModels;

import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@JsonPropertyOrder({"title", "body","tripId"})
public class DummyPost {
    
    String title;
    String body;
    Integer tripId;

    public DummyPost(String title, String body, Integer tripId) {
        this.title = title;
        this.body = body;
        this.tripId = tripId;
        
        
    }

    @Override
    public String toString() {
        return "DummyPost{" + "title=" + title + ", body=" + body + ", tripId=" + tripId + '}';
    }
    
    
}
