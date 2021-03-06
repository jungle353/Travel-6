package kr.co.travel.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Comment_UpdateCommand implements Notice_Command {

	@Override
	public Notice_CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String scomment_num = request.getParameter("comment_num");
		int comment_num = -1;

		if (scomment_num != null) {
			comment_num = Integer.parseInt(scomment_num);
		}
		
		String scomment_board = request.getParameter("comment_board");
		int comment_board = -1;
		if (scomment_board != null) {
			comment_board = Integer.parseInt(scomment_board);
		}

		String comment_content = request.getParameter("comment_content");
		String comment_writer = request.getParameter("comment_writer");
		
		NoticeDAO dao = new NoticeDAO();
		CommentDTO cDto = new CommentDTO(comment_num, comment_board, comment_content, comment_writer, null, -1, -1, -1);
		dao.comment_update(cDto);
		dao.decreaseReadCnt(comment_board);
		
		return new Notice_CommandAction(true, "notice_read.do?num="+comment_board);
	}

}
