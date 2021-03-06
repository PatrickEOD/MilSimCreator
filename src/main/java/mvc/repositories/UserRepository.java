package mvc.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import mvc.entities.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	User findByLogin(String login);
	List<User> getByGroupMember(String groupMember);
}
