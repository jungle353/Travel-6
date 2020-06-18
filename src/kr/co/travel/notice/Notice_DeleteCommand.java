package kr.co.travel.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Notice_DeleteCommand implements Notice_Command {

	@Override
	public Notice_CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String sNum = request.getParameter("num");
		int num = -1;
		if(sNum != null) {
			num = Integer.parseInt(sNum);
		}
		
		NoticeDAO dao = new NoticeDAO();
		dao.delete(num);
		
		return new Notice_CommandAction(true, "notice_list.do");
	}

}
