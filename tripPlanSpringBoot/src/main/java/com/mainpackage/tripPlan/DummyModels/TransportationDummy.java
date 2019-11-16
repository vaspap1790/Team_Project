/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.DummyModels;

import com.mainpackage.tripPlan.model.Transportation;

public class TransportationDummy {
   
   private Transportation oneWay;
   private Transportation roundTrip;

    public TransportationDummy(Transportation oneWay, Transportation roundTrip) {
        this.oneWay = oneWay;
        this.roundTrip = roundTrip;
    }

    public TransportationDummy() {
    }

    public Transportation getOneWay() {
        return oneWay;
    }

    public void setOneWay(Transportation oneWay) {
        this.oneWay = oneWay;
    }

    public Transportation getRoundTrip() {
        return roundTrip;
    }

    public void setRoundTrip(Transportation roundTrip) {
        this.roundTrip = roundTrip;
    }
   
   
}
