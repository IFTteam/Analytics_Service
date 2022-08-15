package com.dukejiang.email_analytics.controller;

import com.dukejiang.email_analytics.model.Audience;
import com.dukejiang.email_analytics.model.Response;
import com.dukejiang.email_analytics.model.Transmission;
import com.dukejiang.email_analytics.model.AudienceActivity;
import com.dukejiang.email_analytics.model.event_payload.Event;
import com.dukejiang.email_analytics.repository.AudienceActivityRepository;
import com.dukejiang.email_analytics.repository.AudienceRepository;
import com.dukejiang.email_analytics.repository.TransmissionRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
    public ResponseEntity<Response> handleEventWebhook(RequestEntity<Event> requestEntity){
        log.info("Received event payload from SparkPost");
        HttpHeaders headers = requestEntity.getHeaders();
        Event event = requestEntity.getBody();

        //find corresponding transmission_id
        assert event != null;
        Optional<Transmission> transmission = transmissionRepository
                                                .findById(event.getEventDetail().getTransmission_id());
        assert transmission.isPresent(); // check is not null
        Audience audience = transmission.get().getAudience();
        AudienceActivity audienceActivity = new AudienceActivity();
        audienceActivity.setAudience(audience);
        audienceActivity.setEventType(event.getEventDetail().getType());
        audienceActivity.setAudience_email(audience.getEmail());
        audienceActivityRepository.save(audienceActivity);

        // Spark post requires 200 status code
        Response response = new Response();
        response.setStatusCode("200");
        response.setStatusMsg("Event data received!");
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }
}
