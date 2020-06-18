package kr.co.travel.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Notice_UpdateCommand implements Notice_Command {

	@Override
	public Notice_CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int num = -1;
		String sNum = request.getParameter("num");
		if (sNum != null) {
			num = Integer.parseInt(sNum);
		}
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		NoticeDAO dao = new NoticeDAO();
		dao.update(new NoticeDTO(num, writer, title, content, null, 0));
		
		return new Notice_CommandAction(true, "notice_list.do");
	}

}
