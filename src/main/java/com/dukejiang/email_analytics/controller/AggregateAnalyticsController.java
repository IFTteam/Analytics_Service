package com.dukejiang.email_analytics.controller;

import com.dukejiang.email_analytics.model.User;
import com.dukejiang.email_analytics.model.request.AggregateAnalyticsRequest;
import com.dukejiang.email_analytics.model.aggregate_model.AggregateAnalyticsResponse;
import com.dukejiang.email_analytics.repository.AudienceActivityRepository;
import com.dukejiang.email_analytics.repository.TransmissionRepository;
import com.dukejiang.email_analytics.repository.UserRepository;
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
@RequestMapping(path = "/analytics/aggregate")
public class AggregateAnalyticsController {
    enum EventType{
        delivery,
        click,
        open,
        list_unsubscribe,
        link_unsubscribe,
        bounce
    }

    private final TransmissionRepository transmissionRepository;
    private final UserRepository userRepository;
    private final AudienceActivityRepository audienceActivityRepository;

    @Autowired
    public AggregateAnalyticsController(TransmissionRepository transmissionRepository,
                                        UserRepository userRepository,
                                        AudienceActivityRepository audienceActivityRepository){
        this.transmissionRepository = transmissionRepository;
        this.userRepository = userRepository;
        this.audienceActivityRepository = audienceActivityRepository;
    }




    @RequestMapping(value={"/getAggregateAnalytics"}, method = GET)
    @ResponseBody
    public Mono<AggregateAnalyticsResponse> getAggregateAnalytics(RequestEntity<AggregateAnalyticsRequest> requestEntity) {
        log.info("fetching aggregate analytics information...");
        AggregateAnalyticsRequest incomingRequest = requestEntity.getBody();
        assert incomingRequest != null;
        int userId = incomingRequest.getUserId();
        String from = incomingRequest.getFrom();
        String to = incomingRequest.getTo();

        //find target user
        Optional<User> user = userRepository.findById(userId);
        assert user.isPresent();
        //get total transmission count
        int totalTransmissionCnt = transmissionRepository.countAllByUser(user.get());
        //get each event type count
        int deliveryCnt = audienceActivityRepository.countByAudienceListAndEventBetween(userId,
                                                                        EventType.delivery.toString(),
                                                                        from, to);
        int clickCnt = audienceActivityRepository.countByAudienceListAndEventBetween(userId,
                                                                        EventType.click.toString(),
                                                                        from, to);
        int openCnt = audienceActivityRepository.countByAudienceListAndEventBetween(userId,
                                                                        EventType.open.toString(),
                                                                        from, to);
        int unsubscribeCnt = audienceActivityRepository.countByAudienceListAndEventBetween(userId,
                                                                        EventType.list_unsubscribe.toString(),
                                                                        from, to) +
                audienceActivityRepository.countByAudienceListAndEventBetween(userId,
                                                                        EventType.link_unsubscribe.toString(),
                                                                        from ,to);
        int bounceCnt = audienceActivityRepository.countByAudienceListAndEventBetween(userId,
                                                                        EventType.bounce.toString(),
                                                                        from, to);

        //compose response
        AggregateAnalyticsResponse response = new AggregateAnalyticsResponse();
        response.setCountSent(totalTransmissionCnt);
        response.setCountClicked(clickCnt);
        response.setCountDelivered(deliveryCnt);
        response.setCountOpened(openCnt);
        response.setCountUnsubscribe(unsubscribeCnt);
        response.setCountBounced(bounceCnt);

        return Mono.just(response);
    }
}
