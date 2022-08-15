package com.dukejiang.email_analytics.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Getter
@Setter
@Table(name="transmission")
public class Transmission extends BaseEntity{
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO, generator="native")
    @GenericGenerator(name = "native", strategy = "native")
    @Column(name = "id")
    private int id;

    @Column(name = "audience_email")
    private String audience_email;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "audience_id", referencedColumnName = "id", nullable = false)
    private Audience audience;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", referencedColumnName = "id", nullable = false)
    private User user;
}
