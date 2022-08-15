package com.dukejiang.email_analytics;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories("com.dukejiang.email_analytics.repository")
@EntityScan
public class EmailAnalyticsApplication {

	public static void main(String[] args) {
		SpringApplication.run(EmailAnalyticsApplication.class, args);
	}

}
