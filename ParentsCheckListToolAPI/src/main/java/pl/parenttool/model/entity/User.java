package pl.parenttool.model.entity;

import lombok.*;

import javax.persistence.*;
import java.util.UUID;

@Entity
@Table(name = "user")
@RequiredArgsConstructor
@Getter
@Setter
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private UUID id;

    @Column(name = "login")
    private String login;

    @Column(name = "email")
    private String email;

    @Column(name = "user_details")
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "userDetails_id", referencedColumnName = "id")
    private UserDetails userDetails;
}
