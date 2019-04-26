package pl.parenttool.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.parenttool.model.entity.ShoppingList;
import pl.parenttool.repository.ShoppingListRepository;

import java.util.List;

@Service
public class ShoppingListServiceImpl implements ShoppingListService {

    @Autowired
    private ShoppingListRepository shoppingListRepository;

    @Override
    public List<ShoppingList> findAllItems() {
        return shoppingListRepository.findAll();
    }
}
