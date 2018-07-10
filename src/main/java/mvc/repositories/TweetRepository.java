package mvc.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import mvc.entities.Tweet;
import mvc.entities.User;

@Repository
public interface TweetRepository extends JpaRepository<Tweet, Long> {

	List<Tweet> findByUser(User user);
}
