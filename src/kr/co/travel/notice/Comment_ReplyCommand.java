package kr.co.travel.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Comment_ReplyCommand implements Notice_Command {

	@Override
	public Notice_CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String sNum = request.getParameter("comment_num");
		int comment_num = -1;
		if(sNum!=null) {
			comment_num = Integer.parseInt(sNum);
		}
		
		String scomment_board = request.getParameter("comment_board");
		int comment_board = -1;
		if (scomment_board != null) {
			comment_board = Integer.parseInt(scomment_board);
		}

		String comment_content = request.getParameter("comment_content");
		String comment_writer = request.getParameter("comment_writer");

		String comment_day = request.getParameter("comment_day");
		
		String srepRoot = request.getParameter("repRoot");
		int repRoot = -1;
		if (srepRoot != null) {
			repRoot = Integer.parseInt(srepRoot);
		}
		
		
		String srepIndent  = request.getParameter("repIndent");
		int repIndent = -1;
		if (srepIndent != null) {
			repIndent = Integer.parseInt(srepIndent);
		}
		
		
		
		NoticeDAO dao = new NoticeDAO();
		CommentDTO dto = new CommentDTO(comment_num, comment_board, comment_content, comment_writer, comment_day, repRoot, -1, repIndent);
		dao.reply(comment_num, dto);
		
		return new Notice_CommandAction(true, "notice_read.do?num="+comment_board);
	}

}
