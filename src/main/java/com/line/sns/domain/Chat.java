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
@Table(name = "sns_chat")
public class Chat implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Long createAt;

    @Column(nullable = false)
    private String content;

    @Column
    private Double pictureWidth;

    @Column
    private Double pictureHeight;

    @Column(nullable = false)
    private Boolean downloaded;

    @Column(nullable = false)
    private Integer type;

    @Column(nullable = false)
    private Integer seq;

    @Column(nullable = false)
    private Boolean direction;

    @ManyToOne
    @JoinColumn(name = "chat_room_id", nullable = false)
    private ChatRoom room;

}
