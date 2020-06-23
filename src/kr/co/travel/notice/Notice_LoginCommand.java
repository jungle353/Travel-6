package kr.co.travel.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Notice_LoginCommand implements Notice_Command {

	@Override
	public Notice_CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		Notice_LoginDTO dto = new Notice_LoginDTO(id, null);
		NoticeDAO dao = new NoticeDAO();
		boolean isLogin;
		isLogin = dao.login(new Notice_LoginDTO(id, pw));
		
		if (isLogin) {
			HttpSession session = request.getSession();
			session.setAttribute("login", dto);
			session.setMaxInactiveInterval(10);
			return new Notice_CommandAction(true, "notice_list.do");
		} else {
			return new Notice_CommandAction(true, "notice_loginui.do");
		}
	}

}
