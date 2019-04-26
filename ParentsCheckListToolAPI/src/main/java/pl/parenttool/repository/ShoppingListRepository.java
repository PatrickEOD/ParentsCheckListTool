package pl.parenttool.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.parenttool.model.entity.ShoppingList;

@Repository
public interface ShoppingListRepository extends JpaRepository<ShoppingList, Long> {
}
