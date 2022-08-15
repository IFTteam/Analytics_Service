package com.dukejiang.email_analytics.model.event_payload;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonRootName;
import com.fasterxml.jackson.databind.JsonNode;
import lombok.*;

import java.util.HashMap;
import java.util.Map;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Event {
    @JsonProperty("msys")
    private Msys msys;
//    private int transmissionId;
//
//    private String type;
//
//    private String audienceEmail;
//
//    @SuppressWarnings("unchecked")
//    @JsonProperty("message_event")
//    @JsonAlias({"track_event", "gen_event", "unsubscribe_event", "relay_event"})
//    private void unpackNested(Map<String, Object> event){
//        Map<String, Object> details = (Map<String, Object>)event.get("msys");
//        this.transmissionId = (int)details.get("transmission_id");
//        this.type = (String)details.get("type");
//        this.audienceEmail = (String)details.get("rcpt_to");
//    }
//    @JsonProperty("message_event")
//    @JsonAlias({"track_event", "gen_event", "unsubscribe_event", "relay_event"})
//    private Map<String, Object> details = new HashMap<>();
//
//    @JsonAnySetter
//    private void setDetail(String key, Object value) {
//        details.put(key, value);
//    }
//    @JsonProperty("message_event")
//    @JsonAlias({"track_event", "gen_event", "unsubscribe_event", "relay_event"})
//    private JsonNode details;
}
