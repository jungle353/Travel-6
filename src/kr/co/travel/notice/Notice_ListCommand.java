package kr.co.travel.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Notice_ListCommand implements Notice_Command {

	@Override
	public Notice_CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NoticeDAO dao = new NoticeDAO();
		List<NoticeDTO> list = dao.list();
		
		request.setAttribute("list", list);
		
		return new Notice_CommandAction(false, "notice_list.jsp");
	}

}
