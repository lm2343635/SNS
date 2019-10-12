package com.line.sns.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "sns_user")
public class User implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Long createdAt;

    @Column(nullable = false)
    private Long updatedAt;

    @Column
    private String avatar;

    @Column
    private String name;

    @OneToOne
    @JoinColumn(nullable = true, name = "email_id")
    private Email email;

    @OneToOne
    @JoinColumn(nullable = true, name = "facebook_id")
    private Facebook facebook;

}