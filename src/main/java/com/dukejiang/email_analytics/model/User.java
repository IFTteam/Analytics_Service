package com.dukejiang.email_analytics.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.validation.annotation.Validated;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Getter
@Setter
@Table(name="user")
@Validated
public class User extends BaseEntity{
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO,generator="native")
    @GenericGenerator(name = "native",strategy = "native")
    @Column(name = "id")
    private int id;

    @Column(name = "username")
    private String username;

    @Column(name = "password_hash")
    private String passwordHash;

    @Column(name = "avatar_url")
    private String avatarUrl;

    @Column(name = "domain")
    private String domain;

    @Column(name = "company_id")
    private String companyId;

    @Column(name = "unsubscribe_link")
    private String unsubscribeLink;

    @Column(name = "subscription_type")
    private String subscriptionType;

    @Column(name = "unsubscribe_type")
    private String unsubscribeType;

    @Column(name = "contact_name")
    private String contactName;

    @Column(name = "contact_email")
    private String contactEmail;

    @Column(name = "contact_phone")
    private String contactPhone;

    @Column(name = "address")
    private String address;

    @Column(name = "api_key")
    private String apiKey;

    @Column(name = "salesforce_api_key")
    private String salesForceApiKey;

    @Column(name = "shopify_api_key")
    private String shopifyApiKey;

    @Column(name = "hubspot_api_key")
    private String hubspotApiKey;

    @Column(name = "facebook_ads_api_key")
    private String facebookAdsApiKey;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY,
               cascade = CascadeType.PERSIST, targetEntity = Transmission.class)
    private Set<Transmission> transmissions;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
    @JoinTable(name = "user_audience",
                joinColumns = {
                    @JoinColumn(name = "user_id", referencedColumnName = "id")},
                inverseJoinColumns = {
                    @JoinColumn(name = "audience_id", referencedColumnName = "id")})
    private Set<Audience> audiences = new HashSet<>();
}
