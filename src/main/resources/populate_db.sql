-- insert users
INSERT INTO user (created_at, created_by, username, password_hash, domain,
                  unsubscribe_link, subscription_type, unsubscribe_type, api_key)
    VALUES ("2022-08-12 12:14:53","Duke", "Duke", "12345", "sub.paradx.net", "n/a", "n/a", "n/a", "12345");

INSERT INTO user (created_at, created_by, username, password_hash, domain,
                  unsubscribe_link, subscription_type, unsubscribe_type, api_key)
VALUES ("2022-08-11 12:14:53","Duke1", "Duke1", "12345", "sub.paradx.net", "n/a", "n/a", "n/a", "12345");

-- insert audience
INSERT INTO audience (created_at, created_by, email,first_name, last_name, source, marketing_consent)
    VALUES ("2022-08-12 12:14:53","Duke","yuxuanjiang@uchicago.edu","Yuxuan", "Jiang","test",1);

INSERT INTO audience (created_at, created_by, email,first_name, last_name, source, marketing_consent)
VALUES ("2022-08-11 12:14:53","Duke","yuxuanjiang1@uchicago.edu","Yuxuan", "Jiang1","test",1);

-- establish user audience relationship
INSERT INTO user_audience (user_id, audience_id) VALUES (1,2);

INSERT INTO user_audience (user_id, audience_id) VALUES (2,1);


-- created audience activities
INSERT INTO audience_activity (created_at, created_by, event_type, audience_id, audience_email)
    VALUES ("2022-08-12 12:14:53","Duke","delivery",1,"yuxuanjiang@uchicago.edu");

INSERT INTO audience_activity (created_at, created_by, event_type, audience_id, audience_email)
VALUES ("2022-08-11 12:14:53","Duke","delivery",1,"yuxuanjiang@uchicago.edu");

INSERT INTO audience_activity (created_at, created_by, event_type, audience_id, audience_email)
VALUES ("2022-08-10 12:14:53","Duke","delivery",1,"yuxuanjiang@uchicago.edu");

INSERT INTO audience_activity (created_at, created_by, event_type, audience_id, audience_email)
VALUES ("2022-08-12 13:14:53","Duke","delivery",1,"yuxuanjiang@uchicago.edu");

INSERT INTO audience_activity (created_at, created_by, event_type, audience_id, audience_email)
VALUES ("2022-08-11 12:14:53","Duke","bounce",1,"yuxuanjiang@uchicago.edu");

INSERT INTO audience_activity (created_at, created_by, event_type, audience_id, audience_email)
VALUES ("2022-08-10 12:14:53","Duke","bounce",1,"yuxuanjiang@uchicago.edu");

INSERT INTO audience_activity (created_at, created_by, event_type, audience_id, audience_email)
VALUES ("2022-08-12 13:14:53","Duke","bounce",1,"yuxuanjiang@uchicago.edu");

INSERT INTO audience_activity (created_at, created_by, event_type, audience_id, audience_email)
VALUES ("2022-08-10 12:14:53","Duke","click",1,"yuxuanjiang@uchicago.edu");

INSERT INTO audience_activity (created_at, created_by, event_type, audience_id, audience_email)
VALUES ("2022-08-12 13:14:53","Duke","open",1,"yuxuanjiang@uchicago.edu");