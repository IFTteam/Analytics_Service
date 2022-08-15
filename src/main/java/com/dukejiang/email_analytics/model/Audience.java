package com.dukejiang.email_analytics.model;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.validation.annotation.Validated;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.sql.Timestamp;
import java.util.Set;

@Entity
@Getter
@Setter
@Table(name="audience")
@Validated
public class Audience extends BaseEntity{
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO,generator="native")
    @GenericGenerator(name = "native",strategy = "native")
    @Column(name = "id")
    private int id;

    @Column(name = "email")
    @NotNull
    private String email;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "address")
    private String address;

    @Column(name = "phone")
    private String phone;

    @Column(name = "birthday")
    private Timestamp birthday;

    @Column(name = "source")
    @NotNull
    private String source;

    @OneToMany(mappedBy = "audience", fetch = FetchType.LAZY,
            cascade = CascadeType.PERSIST, targetEntity = Transmission.class)
    private Set<Transmission> transmissions;

}
