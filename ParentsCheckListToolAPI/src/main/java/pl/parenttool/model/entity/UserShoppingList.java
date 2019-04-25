package pl.parenttool.model.entity;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "user_shopping_list")
@RequiredArgsConstructor
@Getter
@Setter
public class UserShoppingList {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "item_name")
    private String itemName;

    @Column(name = "amount")
    private Double amount;

    @Column(name = "notes", columnDefinition = "text")
    private String notes;

    @Column(name = "items")
    @OneToMany(mappedBy = "userShoppingList")
    private List<ShoppingList> items;
}
