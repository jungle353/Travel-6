package kr.co.travel.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Notice_UpdateUICommand implements Notice_Command {

	@Override
	public Notice_CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String sNum = request.getParameter("num");
		int num = -1;
		if(sNum != null) {
			num = Integer.parseInt(sNum);
		}
		
		NoticeDAO dao = new NoticeDAO();
		NoticeDTO dto = dao.updatUI(num);
		
		request.setAttribute("dto", dto);
		
		return new Notice_CommandAction(false, "notice_update.jsp");
	}

}
