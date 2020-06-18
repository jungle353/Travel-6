package kr.co.travel.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Notice_ListPageCommand implements Notice_Command {

	@Override
	public Notice_CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String scurPage = request.getParameter("curPage");
		int curPage = 1;
		if (scurPage != null) {
			curPage = Integer.parseInt(scurPage);
		}
		
		NoticeDAO dao = new NoticeDAO();
		Notice_PageTO to = dao.page(curPage);
		
		request.setAttribute("to", to);
		request.setAttribute("list", to.getList());
		
		return new Notice_CommandAction(false, "notice_list.jsp");
	}

}
