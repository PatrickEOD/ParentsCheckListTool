package pl.parenttool.model.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "shopping_list")
@RequiredArgsConstructor
@Getter
@Setter
public class ShoppingList {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "item_name")
    private String itemName;

    @Column(name = "item_price_from")
    private Double itemPriceFrom;

    @Column(name = "item_price_to")
    private Double itemPriceTo;

    @Column(name = "currency")
    private String currency;

    @Column(name = "recomm_amount")
    private Double recommendedAmount;

    @Column(name = "img_src")
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "img_id", referencedColumnName = "id")
    private ImgSrc img;

    @Column(name = "description", columnDefinition = "text")
    private String description;

    @Column(name = "characteristic", columnDefinition = "text")
    private String characteristic;

    @Column(name = "category")
    private String category;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "userShoppingList_id")
    private UserShoppingList userShoppingList;

}
