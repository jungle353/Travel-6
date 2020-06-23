package kr.co.travel.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Notice_LoginCommand2 implements Notice_Command {

	@Override
	public Notice_CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
			if(session != null) {
				Notice_LoginDTO login = (Notice_LoginDTO) session.getAttribute("login");
				if(login == null) {
					return new Notice_CommandAction(true, "notice_loginui.do");
				}
			}
		return new Notice_CommandAction(true, "notice_list.do");
	}
}
