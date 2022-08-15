package com.dukejiang.email_analytics.model.event_payload;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Msys {
    @JsonProperty("message_event")
    @JsonAlias({"track_event", "gen_event", "unsubscribe_event", "relay_event"})
    private EventDetail eventDetail;

}