package com.dukejiang.email_analytics.model.event_payload;


import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import java.math.BigInteger;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class EventDetail {
    @JsonProperty("transmission_id")
    private String transmissionId;

    @JsonProperty("type")
    private String type;

    @JsonProperty("rcpt_to")
    private String audienceEmail;


}
