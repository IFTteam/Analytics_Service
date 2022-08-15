package com.dukejiang.email_analytics.controller;

import com.dukejiang.email_analytics.model.Audience;
import com.dukejiang.email_analytics.model.request.IndividualAnalyticsRequest;
import com.dukejiang.email_analytics.model.individual_model.IndividualAnalyticsResponse;
import com.dukejiang.email_analytics.repository.AudienceActivityRepository;
import com.dukejiang.email_analytics.repository.AudienceRepository;
import com.dukejiang.email_analytics.repository.TransmissionRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.RequestEntity;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import reactor.core.publisher.Mono;

import java.util.Optional;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

@Slf4j // logger
@RestController
@RequestMapping(path = "/analytics/individual")
public class IndividualAnalyticsController {
    enum EventType{
        delivery,
        click,
        open,
        list_unsubscribe,
        link_unsubscribe,
        bounce
    }

    @Autowired
    AudienceActivityRepository audienceActivityRepository;

    @Autowired
    AudienceRepository audienceRepository;

    @Autowired
    TransmissionRepository transmissionRepository;


    /**
     * sends back the aggregated count of each event types in audience_activity table
     * @return aggregated count and total count (of transmission)
     */
    @RequestMapping(value={"/getIndividualAnalytics"}, method = GET)
    @ResponseBody
    public Mono<IndividualAnalyticsResponse> getIndividualAnalytics(RequestEntity<IndividualAnalyticsRequest> requestEntity) {
        log.info("fetching individual analytics information...");
        IndividualAnalyticsRequest incomingRequest = requestEntity.getBody();
        assert incomingRequest != null;
        int audienceId = incomingRequest.getAudienceId();
        String from = incomingRequest.getFrom();
        String to = incomingRequest.getTo();

        //find target audience
        log.info("finding target audience");
        Optional<Audience> audience = audienceRepository.findById(audienceId);
        assert audience.isPresent();
        log.info("target audience found");
        //get total transmission count
        int totalTransmissionCnt = transmissionRepository.countAllByAudience(audience.get());
        //get each event type count
        int deliveryCnt = audienceActivityRepository.countByAudienceAndEventBetween(audienceId,
                                                                EventType.delivery.toString(),
                                                                from, to);
        int clickCnt = audienceActivityRepository.countByAudienceAndEventBetween(audienceId,
                                                                EventType.click.toString(),
                                                                from, to);
        int openCnt = audienceActivityRepository.countByAudienceAndEventBetween(audienceId,
                                                                EventType.open.toString(),
                                                                from, to);
        int unsubscribeCnt = audienceActivityRepository.countByAudienceAndEventBetween(audienceId,
                                                                EventType.list_unsubscribe.toString(),
                                                                from, to) +
                            audienceActivityRepository.countByAudienceAndEventBetween(audienceId,
                                                                        EventType.link_unsubscribe.toString(),
                                                                        from ,to);
        int bounceCnt = audienceActivityRepository.countByAudienceAndEventBetween(audienceId,
                                                                EventType.bounce.toString(),
                                                                from, to);

        //compose response
        IndividualAnalyticsResponse response = new IndividualAnalyticsResponse();
        response.setCountSent(totalTransmissionCnt);
        response.setCountClicked(clickCnt);
        response.setCountDelivered(deliveryCnt);
        response.setCountOpened(openCnt);
        response.setCountUnsubscribe(unsubscribeCnt);
        response.setCountBounced(bounceCnt);

        return Mono.just(response);
    }
}
