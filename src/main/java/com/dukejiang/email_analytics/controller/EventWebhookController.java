package com.dukejiang.email_analytics.controller;

import com.dukejiang.email_analytics.model.Audience;
import com.dukejiang.email_analytics.model.Response;
import com.dukejiang.email_analytics.model.Transmission;
import com.dukejiang.email_analytics.model.AudienceActivity;
import com.dukejiang.email_analytics.model.event_payload.Event;
import com.dukejiang.email_analytics.repository.AudienceActivityRepository;
import com.dukejiang.email_analytics.repository.AudienceRepository;
import com.dukejiang.email_analytics.repository.TransmissionRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigInteger;
import java.time.LocalDateTime;
import java.util.Optional;

import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Slf4j
@RestController
@RequestMapping(path = "/analytics/webhook")
public class EventWebhookController {

    @Autowired
    AudienceRepository audienceRepository;

    @Autowired
    AudienceActivityRepository audienceActivityRepository;

    @Autowired
    TransmissionRepository transmissionRepository;

    //respond to incoming webhook, uses transmission id to query transmission entity, get audience_id
    //and audience_email. Then insert into audience_activity table
    @RequestMapping(value = "/eventWebhook", method = POST)
    public ResponseEntity<Response> handleEventWebhook(HttpEntity<String> httpEntity) throws JsonProcessingException {
        //if(event.getDetails() == null) return ResponseEntity.status(HttpStatus.NOT_FOUND).body(new Response());
        String json = httpEntity.getBody();
        log.info("Received event payload from SparkPost");
        Event event = new ObjectMapper().readerFor(Event.class).readValue(json);
//        int transmissionId = event.getDetails().get("transmission_id").asInt();
//        String eventType = event.getDetails().get("type").asText();
//        int transmissionId = Integer.parseInt(event.getDetails().get("transmission_id").toString());
//        String eventType = event.getDetails().get("type").toString();
        String transmissionId = event.getMsys().getEventDetail().getTransmissionId();
        String eventType = event.getMsys().getEventDetail().getType();
        log.info("Transmission id is " + transmissionId);

        //find corresponding transmission_id
        Optional<Transmission> transmission = transmissionRepository
                                                .findById(transmissionId);
        assert transmission.isPresent(); // check is not null
        Audience audience = transmission.get().getAudience();
        AudienceActivity audienceActivity = new AudienceActivity();
        audienceActivity.setAudience(audience);
        audienceActivity.setEventType(eventType);
        audienceActivity.setAudience_email(audience.getEmail());
        audienceActivity.setCreatedAt(LocalDateTime.now());
        audienceActivity.setCreatedBy("SparkPost");
        audienceActivityRepository.save(audienceActivity);

        // Spark post requires 200 status code
        Response response = new Response();
        response.setStatusCode("200");
        response.setStatusMsg("Event data received!");
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }
}
