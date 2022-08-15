package com.dukejiang.email_analytics.model.event_payload;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonRootName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonRootName("msys")
public class Event {
    @JsonProperty("message_event")
    @JsonAlias({"track_event", "gen_event", "unsubscribe_event", "relay_event"})
    private EventDetail eventDetail;
}
