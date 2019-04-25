package pl.parenttool.model.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "img_src")
@RequiredArgsConstructor
@Getter
@Setter
public class ImgSrc {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "img", columnDefinition = "text")
    private String img;

    @JsonIgnore
    @OneToOne(mappedBy = "img")
    private ShoppingList shoppingList;
}
