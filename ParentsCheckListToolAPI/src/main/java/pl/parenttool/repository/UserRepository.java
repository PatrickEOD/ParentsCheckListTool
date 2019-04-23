package pl.parenttool.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pl.parenttool.model.entity.User;

import java.util.UUID;

@Repository
public interface UserRepository extends JpaRepository <User, UUID> {

    User findByLogin(@Param("login") String login);

}
