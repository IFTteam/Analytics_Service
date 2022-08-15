create database email_automation;

use email_automation;

CREATE TABLE IF NOT EXISTS `user`(
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `created_at` TIMESTAMP NOT NULL,
    `created_by` VARCHAR(255) NOT NULL,
    `updated_at` TIMESTAMP DEFAULT NULL,
    `updated_by` VARCHAR(255) DEFAULT NULL,
    `username` VARCHAR(255) NOT NULL,
    `password_hash` VARCHAR(255) NOT NULL,
    `avatar_url` VARCHAR(1024),
    `domain` VARCHAR(255) NOT NULL,
    `company_id` BIGINT DEFAULT NULL,
    `unsubscribe_link` VARCHAR(255) NOT NULL,
    `subscription_type` VARCHAR(255) NOT NULL,
    `unsubscribe_type` VARCHAR(255) NOT NULL,
    `contact_name` VARCHAR(255),
    `contact_email` VARCHAR(255),
    `contact_phone` VARCHAR(255),
    `address` VARCHAR(255),
    `api_key` VARCHAR(255) NOT NULL,
    `salesforce_api_key` VARCHAR(255),
    `shopify_api_key` VARCHAR(255),
    `hubspot_api_key` VARCHAR(255),
    `facebook_ads_api_key` VARCHAR(255)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `audience_list`(
      `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
      `created_at` TIMESTAMP NOT NULL,
      `created_by` VARCHAR(255) NOT NULL,
      `updated_at` TIMESTAMP DEFAULT NULL,
      `updated_by` VARCHAR(255) DEFAULT NULL,
      `name` VARCHAR(255) NOT NULL
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `campaign`(
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `created_at` TIMESTAMP NOT NULL,
    `created_by` VARCHAR(255) NOT NULL,
    `updated_at` TIMESTAMP DEFAULT NULL,
    `updated_by` VARCHAR(255) DEFAULT NULL,
    `name` VARCHAR(255) NOT NULL,
    `email_template_serialized` TEXT NOT NULL,
    `sender` VARCHAR(255) NOT NULL,
    `subject` VARCHAR(1024),
    `campaign_industry` VARCHAR(255),
    `reply_to` VARCHAR(255) NOT NULL,
    `run_times` INT NOT NULL,
    `send_times` INT NOT NULL,
    `number_of_recipients` INT,
    `number_delivered` INT,
    `number_opened` INT,
    `percentage_opened` FLOAT(2),
    `number_clicked` INT,
    `percentage_clicked` FLOAT(2),
    `number_unsubscribed` INT,
    `percentage_unsubscribed` FLOAT(2)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `objective`(
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
  `created_at` TIMESTAMP NOT NULL,
  `created_by` VARCHAR(255) NOT NULL,
  `updated_at` TIMESTAMP DEFAULT NULL,
  `updated_by` VARCHAR(255) DEFAULT NULL
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `journey_template`(
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
  `created_at` TIMESTAMP NOT NULL,
  `created_by` VARCHAR(255) NOT NULL,
  `updated_at` TIMESTAMP DEFAULT NULL,
  `updated_by` VARCHAR(255) DEFAULT NULL,
  `journey_name` VARCHAR(255) NOT NULL,
  `thumbnail_url` VARCHAR(255) NOT NULL,
  `journey_template_serialized`TEXT NOT NULL
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `journey`(
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
  `created_at` TIMESTAMP NOT NULL,
  `created_by` VARCHAR(255) NOT NULL,
  `updated_at` TIMESTAMP DEFAULT NULL,
  `updated_by` VARCHAR(255) DEFAULT NULL,
  `journey_name` VARCHAR(255) NOT NULL,
  `thumbnail_url` VARCHAR(255) NOT NULL,
  `journey_template_serialized` TEXT NOT NULL,
  `status` INT NOT NULL,
  `stage` VARCHAR(255) NOT NULL
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `analytics`(
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
  `created_at` TIMESTAMP NOT NULL,
  `created_by` VARCHAR(255) NOT NULL,
  `updated_at` TIMESTAMP DEFAULT NULL,
  `updated_by` VARCHAR(255) DEFAULT NULL,
  `number_of_recipients` INT,
  `number_delivered` INT,
  `number_opened` INT,
  `percentage_opened` FLOAT(2),
  `number_clicked` INT,
  `percentage_clicked` FLOAT(2),
  `number_unsubscribed` INT,
  `percentage_unsubscribed` FLOAT(2)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `node`(
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
  `created_at` TIMESTAMP NOT NULL,
  `created_by` VARCHAR(255) NOT NULL,
  `updated_at` TIMESTAMP DEFAULT NULL,
  `updated_by` VARCHAR(255) DEFAULT NULL,
  `name` VARCHAR(255) NOT NULL,
  `type` VARCHAR(10) NOT NULL,
  `status` VARCHAR(10) NOT NULL,
  `neighbors_serialized` TEXT
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `time_event`(
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
  `created_at` TIMESTAMP NOT NULL,
  `created_by` VARCHAR(255) NOT NULL,
  `updated_at` TIMESTAMP DEFAULT NULL,
  `updated_by` VARCHAR(255) DEFAULT NULL,
  `node_id` BIGINT NOT NULL,
  `journey_id` BIGINT NOT NULL,
  `user_id` BIGINT NOT NULL,
  `repeat` INT NOT NULL,
  `repeat_numbers` BIGINT NOT NULL,
  `trigger_time` TIMESTAMP NOT NULL,
  FOREIGN KEY (node_id) REFERENCES node(id)
                           ON DELETE CASCADE
                           ON UPDATE CASCADE,
  FOREIGN KEY (journey_id) REFERENCES journey(id)
                            ON DELETE CASCADE
                            ON UPDATE CASCADE,
  FOREIGN KEY (user_id) REFERENCES user(id)
                          ON DELETE CASCADE
                          ON UPDATE CASCADE
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `audience`(
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
  `created_at` TIMESTAMP NOT NULL,
  `created_by` VARCHAR(255) NOT NULL,
  `updated_at` TIMESTAMP DEFAULT NULL,
  `updated_by` VARCHAR(255) DEFAULT NULL,
  `email` VARCHAR(255) NOT NULL,
  `first_name` VARCHAR(255),
  `last_name` VARCHAR(255),
  `address` TEXT,
  `phone` VARCHAR(255),
  `birthday` TIMESTAMP,
  `source` VARCHAR(255) NOT NULL,
  `marketing_consent` int DEFAULT 1 NOT NULL
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `tag`(
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `created_at` TIMESTAMP NOT NULL,
    `created_by` VARCHAR(255) NOT NULL,
    `updated_at` TIMESTAMP DEFAULT NULL,
    `updated_by` VARCHAR(255) DEFAULT NULL,
    `tag_name` VARCHAR(255) NOT NULL
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `payment`(
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
  `created_at` TIMESTAMP NOT NULL,
  `created_by` VARCHAR(255) NOT NULL,
  `updated_at` TIMESTAMP DEFAULT NULL,
  `updated_by` VARCHAR(255) DEFAULT NULL,
  `payment_method` VARCHAR(255) NOT NULL,
  `payment_date` TIMESTAMP NOT NULL,
  `card_number` VARCHAR(255) NOT NULL,
  `first_name` VARCHAR(255),
  `last_name` VARCHAR(255),
  `billing_info` TEXT
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `team_member`(
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
  `created_at` TIMESTAMP NOT NULL,
  `created_by` VARCHAR(255) NOT NULL,
  `updated_at` TIMESTAMP DEFAULT NULL,
  `updated_by` VARCHAR(255) DEFAULT NULL,
  `username` VARCHAR(255) NOT NULL,
  `account_email` VARCHAR(255),
  `assigned_role` VARCHAR(255) NOT NULL,
  `joined_time` TIMESTAMP
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `team`(
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
  `created_at` TIMESTAMP NOT NULL,
  `created_by` VARCHAR(255) NOT NULL,
  `updated_at` TIMESTAMP DEFAULT NULL,
  `updated_by` VARCHAR(255) DEFAULT NULL,
  `name` VARCHAR(255) NOT NULL
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `segment`(
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
  `created_at` TIMESTAMP NOT NULL,
  `created_by` VARCHAR(255) NOT NULL,
  `updated_at` TIMESTAMP DEFAULT NULL,
  `updated_by` VARCHAR(255) DEFAULT NULL,
  `name` VARCHAR(255) NOT NULL
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `audience_activity`(
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
  `created_at` TIMESTAMP NOT NULL,
  `created_by` VARCHAR(255) NOT NULL,
  `updated_at` TIMESTAMP DEFAULT NULL,
  `updated_by` VARCHAR(255) DEFAULT NULL,
  `event_type` VARCHAR(255) NOT NULL,
  `audience_id` BIGINT NOT NULL,
  `audience_email` VARCHAR(255) NOT NULL,
  FOREIGN KEY (audience_id) REFERENCES audience(id)
                                      ON DELETE CASCADE
                                      ON UPDATE CASCADE
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `transmission`(
  `id` BIGINT PRIMARY KEY,
  `created_at` TIMESTAMP NOT NULL,
  `created_by` VARCHAR(255) NOT NULL,
  `updated_at` TIMESTAMP DEFAULT NULL,
  `updated_by` VARCHAR(255) DEFAULT NULL,
  `audience_id` BIGINT NOT NULL,
  `audience_email` VARCHAR(255) NOT NULL,
  `user_id` BIGINT NOT NULL,
  FOREIGN KEY (audience_id) REFERENCES audience(id)
                                      ON DELETE CASCADE
                                      ON UPDATE CASCADE,
  FOREIGN KEY (user_id) REFERENCES user(id)
                                      ON DELETE CASCADE
                                      ON UPDATE CASCADE
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `user_campaign`(
    `user_id` BIGINT NOT NULL,
    `campaign_id` BIGINT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY (`user_id`, `campaign_id`)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `user_objective`(
    `user_id` BIGINT NOT NULL,
    `objective_id` BIGINT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (objective_id) REFERENCES objective(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY (`user_id`, `objective_id`)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `campaign_analytics`(
  `analytics_id` BIGINT NOT NULL,
  `campaign_id` BIGINT NOT NULL,
  FOREIGN KEY (analytics_id) REFERENCES analytics(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY (campaign_id) REFERENCES campaign(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  PRIMARY KEY (`analytics_id`, `campaign_id`)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `campaign_audience_list`(
   `audience_list_id` BIGINT NOT NULL,
   `campaign_id` BIGINT NOT NULL,
   FOREIGN KEY (audience_list_id) REFERENCES audience_list(id)
       ON DELETE CASCADE
       ON UPDATE CASCADE,
   FOREIGN KEY (campaign_id) REFERENCES campaign(id)
       ON DELETE CASCADE
       ON UPDATE CASCADE,
   PRIMARY KEY (`audience_list_id`, `campaign_id`)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `user_journey_template`(
  `user_id` BIGINT NOT NULL,
  `journey_template_id` BIGINT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY (journey_template_id) REFERENCES journey_template(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  PRIMARY KEY (`user_id`, `journey_template_id`)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `user_journey`(
  `user_id` BIGINT NOT NULL,
  `journey_id` BIGINT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY (journey_id) REFERENCES journey(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  PRIMARY KEY (`user_id`, `journey_id`)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `objective_journey`(
  `objective_id` BIGINT NOT NULL,
  `journey_id` BIGINT NOT NULL,
  FOREIGN KEY (objective_id) REFERENCES objective(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY (journey_id) REFERENCES journey(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  PRIMARY KEY (`objective_id`, `journey_id`)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `journey_analytics`(
  `journey_id` BIGINT NOT NULL,
  `analytics_id` BIGINT NOT NULL,
  FOREIGN KEY (journey_id) REFERENCES journey(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY (analytics_id) REFERENCES analytics(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  PRIMARY KEY (`journey_id`, `analytics_id`)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `user_audience`(
  `user_id` BIGINT NOT NULL,
  `audience_id` BIGINT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY (audience_id) REFERENCES audience(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  PRIMARY KEY (`user_id`, `audience_id`)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `journey_node`(
  `journey_id` BIGINT NOT NULL,
  `node_id` BIGINT NOT NULL,
  FOREIGN KEY (journey_id) REFERENCES journey(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY (node_id) REFERENCES node(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  PRIMARY KEY (`journey_id`, `node_id`)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `campaign_node`(
  `node_id` BIGINT NOT NULL,
  `campaign_id` BIGINT NOT NULL,
  FOREIGN KEY (node_id) REFERENCES node(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY (campaign_id) REFERENCES campaign(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  PRIMARY KEY (`node_id`, `campaign_id`)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `node_audience`(
  `node_id` BIGINT NOT NULL,
  `audience_id` BIGINT NOT NULL,
  FOREIGN KEY (node_id) REFERENCES node(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY (audience_id) REFERENCES audience(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  PRIMARY KEY (`node_id`, `audience_id`)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `audience_list_audience`(
  `audience_list_id` BIGINT NOT NULL,
  `audience_id` BIGINT NOT NULL,
  FOREIGN KEY (audience_list_id) REFERENCES audience_list(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY (audience_id) REFERENCES audience(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  PRIMARY KEY (`audience_list_id`, `audience_id`)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `segment_audience`(
  `segment_id` BIGINT NOT NULL,
  `audience_id` BIGINT NOT NULL,
  FOREIGN KEY (segment_id) REFERENCES segment(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY (audience_id) REFERENCES audience(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  PRIMARY KEY (`segment_id`, `audience_id`)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `user_payment`(
  `user_id` BIGINT NOT NULL,
  `payment_id` BIGINT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY (payment_id) REFERENCES payment(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  PRIMARY KEY (`user_id`, `payment_id`)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `tag_journey`(
     `journey_id` BIGINT NOT NULL,
     `tag_id` BIGINT NOT NULL,
     FOREIGN KEY (journey_id) REFERENCES journey(id)
         ON DELETE CASCADE
         ON UPDATE CASCADE,
     FOREIGN KEY (tag_id) REFERENCES tag(id)
         ON DELETE CASCADE
         ON UPDATE CASCADE,
     PRIMARY KEY (`journey_id`, `tag_id`)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `audience_tag`(
    `audience_id` BIGINT NOT NULL,
    `tag_id` BIGINT NOT NULL,
    FOREIGN KEY (audience_id) REFERENCES audience(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES tag(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY (`audience_id`, `tag_id`)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `user_team_member`(
    `user_id` BIGINT NOT NULL,
    `team_member_id` BIGINT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (team_member_id) REFERENCES team_member(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY (`user_id`, `team_member_id`)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS `team_member_team`(
    `team_member_id` BIGINT NOT NULL,
    `team_id` BIGINT NOT NULL,
    FOREIGN KEY (team_member_id) REFERENCES team_member(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (team_id) REFERENCES team(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY (`team_member_id`, `team_id`)
)Engine=InnoDB;


-- core module database

/*Table structure for table `active_journey` */

DROP TABLE IF EXISTS `active_journey`;

CREATE TABLE `active_journey` (
  `id` bigint NOT NULL,
  `journey_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Table structure for table `active_node` */

DROP TABLE IF EXISTS `active_node`;

CREATE TABLE `active_node` (
   `id` bigint NOT NULL,
   `node_id` bigint DEFAULT NULL,
   `node_journey_id` bigint DEFAULT NULL,
   PRIMARY KEY (`id`),
   KEY `node_journey_id` (`node_journey_id`),
   CONSTRAINT `active_node_ibfk_1` FOREIGN KEY (`node_journey_id`) REFERENCES `active_journey` (`id`)
                                                                        ON DELETE CASCADE
                                                                        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `active_audience`;

CREATE TABLE `active_audience` (
   `id` bigint NOT NULL,
   `audience_id` bigint DEFAULT NULL,
   `audience_node_id` bigint DEFAULT NULL,
   PRIMARY KEY (`id`),
   KEY `audience_node_id` (`audience_node_id`),
   CONSTRAINT `active_audience_ibfk_1` FOREIGN KEY (`audience_node_id`) REFERENCES `active_node` (`id`)
       ON DELETE CASCADE
       ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;