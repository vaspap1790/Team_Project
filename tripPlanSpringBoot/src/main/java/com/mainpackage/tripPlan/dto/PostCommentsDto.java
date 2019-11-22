/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.dto;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class PostCommentsDto {
    
    int commentId;
    int postId;
    int tripId;
    String text;
    String username;

    public PostCommentsDto(int commentId, int postId, int tripId, String text, String username) {
        this.commentId = commentId;
        this.postId = postId;
        this.tripId = tripId;
        this.text = text;
        this.username = username;
    }



  
}
