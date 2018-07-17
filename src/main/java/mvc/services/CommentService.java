package mvc.services;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mvc.entities.Comment;
import mvc.entities.Tweet;
import mvc.entities.User;
import mvc.repositories.CommentRepository;

@Service
public class CommentService {

	private CommentRepository commentRepository;
	
	@Autowired
	public CommentService(CommentRepository commentRepository) {
		this.commentRepository = commentRepository;
	}
	
	@Transactional
	public void saveComment(Comment comment) {
		commentRepository.save(comment);
	}
	
	@Transactional
	public Comment getComment(Long id) {
		Comment comment = commentRepository.findOne(id);
		return comment;
	}
	
	@Transactional
	public List<Comment> getCommentList() {
		List<Comment> comments = new ArrayList<Comment>();
		comments = commentRepository.findAll();
		sortCollectionByDate(comments);
		return comments;
	}
	
	@Transactional
	public List<Comment> getCommentList(User user) {
		List<Comment> comments = new ArrayList<Comment>();
		comments = commentRepository.findByUser(user);
		sortCollectionByDate(comments);
		return comments;
	}
	
	@Transactional
	public void deleteComment(Long id) {
		commentRepository.delete(commentRepository.findOne(id));
	}
	
	//Utils for single class
	
		//Sorting collection by descending order
		private void sortCollectionByDate(List<Comment> comments) {
			Collections.sort(comments, new Comparator<Comment>() {
				public int compare(Comment c1, Comment c2) {
					if(c1.getCreated() == null || c2.getCreated() == null) {
						return 0;
					}
					return c2.getCreated().compareTo(c1.getCreated());
				}
			});
		}
}
