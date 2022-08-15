package com.dukejiang.email_analytics.service;

import com.dukejiang.email_analytics.repository.AudienceActivityRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class EvenWebhookService {
    @Autowired
    private AudienceActivityRepository audienceActivityRepository;


}
