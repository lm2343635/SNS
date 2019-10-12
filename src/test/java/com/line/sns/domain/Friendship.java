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
@Table(name = "sns_friendship")
public class Friendship implements Serializable {

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

    @ManyToOne
    @JoinColumn(nullable = false, name = "user1_id")
    private User user1;

    @ManyToOne
    @JoinColumn(nullable = false, name = "user2_id")
    private User user2;

}
