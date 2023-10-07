package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.dao.CommentRateDAO;
import spring.model.CommentRate;

@Service
public class CommentRateService {
	@Autowired
	private CommentRateDAO commentRateDAO;
	public int addComment(CommentRate commentRate) {
		return commentRateDAO.addComment(commentRate);
	}
	public List<CommentRate> getListCmt(int product_id,int prId) {
		return commentRateDAO.getListCmt(product_id, prId);
	}
	public List<CommentRate> getListCmtChil(int product_id, int parent_id) {
		return commentRateDAO.getListCmtChil(product_id, parent_id);
	}
	public List<CommentRate> getListAllCmt() {
		
		return commentRateDAO.getListAllCmt();
	}
	public CommentRate getCmtById(int id) {
		return commentRateDAO.getCmtById(id);
	}
	public int upLike(int id, CommentRate cmt) {
		return commentRateDAO.upLike(id, cmt);
	}
	public int disLike(int id, CommentRate cmt) {
		return commentRateDAO.disLike(id, cmt);
	}

}
