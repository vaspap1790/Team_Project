/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.dto;

import com.mainpackage.tripPlan.model.Comment;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class PostCommentsDto {

    int postId;
    Comment comments;

    public PostCommentsDto(int postId,Comment comments) {
        this.postId = postId;
        this.comments = comments;
    }

}
