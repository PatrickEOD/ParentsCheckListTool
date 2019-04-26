package pl.parenttool.service;

import pl.parenttool.model.entity.ShoppingList;

import java.util.List;

public interface ShoppingListService {

    List<ShoppingList> findAllItems();
}
