package com.dukejiang.email_analytics.model.event_payload;


import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class EventDetail {
    @JsonProperty("transmission_id")
    private int transmission_id;

    @JsonProperty("type")
    private String type;

    @JsonProperty("rcpt_to")
    private String audience_email;

}
