package com.dukejiang.email_analytics.repository;

import com.dukejiang.email_analytics.model.Audience;
import com.dukejiang.email_analytics.model.Transmission;
import com.dukejiang.email_analytics.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TransmissionRepository extends JpaRepository<Transmission, String> {
    int countAllByAudience(Audience audience);

    int countAllByUser(User user);
}
