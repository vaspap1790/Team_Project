package com.mainpackage.tripPlan.DummyModels;

import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@JsonPropertyOrder({"username", "postId", "text"})
public class DummyComment {

    String username;
    Integer postId;
    String text;

    public DummyComment(String username, Integer postId, String text) {
        this.username = username;
        this.postId = postId;
        this.text = text;
    }

}
