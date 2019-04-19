package pl.parenttool.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.UUID;

@Entity
@Table(name = "user")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private UUID id;

    @Column(name = "login")
    private String login;

    @Column(name = "login")
    private String email;

    @Column(name = "user_details")
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name  ="userDetails", referencedColumnName = "id")
    private UserDetails userDetails;
}
