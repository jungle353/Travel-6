package kr.co.travel.notice;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FrontController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String ctxp = request.getContextPath();
		String sp = uri.substring(ctxp.length());

		Notice_Command com = null;

		if (sp.equalsIgnoreCase("/notice_list.do")) {
//			com = new Notice_ListCommand();
			com = new Notice_ListPageCommand();
		} else if (sp.equalsIgnoreCase("/notice_insertui.do")) {
			com = new Notice_InsertUICommand();
		} else if (sp.equalsIgnoreCase("/notice_insert.do")) {
			com = new Notice_InsertCommand();
		} else if (sp.equalsIgnoreCase("/notice_read.do")) {
			com = new Notice_ReadCommand();
		} else if (sp.equalsIgnoreCase("/notice_updateui.do")) {
			com = new Notice_UpdateUICommand();
		} else if (sp.equalsIgnoreCase("/notice_update.do")) {
			com = new Notice_UpdateCommand();
		} else if (sp.equalsIgnoreCase("/notice_delete.do")) {
			com = new Notice_DeleteCommand();
		} else if (sp.equalsIgnoreCase("/notice_loginui.do")) {
			com = new Notice_LoginUICommand();
		} else if (sp.equalsIgnoreCase("/notice_login.do")) {
			com = new Notice_LoginCommand();
		} else if (sp.equalsIgnoreCase("/notice_logout.do")) {
			com = new Notice_LogoutCommand();
		} else if (sp.equalsIgnoreCase("/notice_cinsert.do")) {
			com = new Comment_InsertCommand();
		} else if (sp.equalsIgnoreCase("/notice_reply.do")) {
			com = new Comment_ReplyCommand();
		} else if (sp.equalsIgnoreCase("/notice_cupdate.do")) {
			com = new Comment_UpdateCommand();
		} else if (sp.equalsIgnoreCase("/notice_cdelete.do")) {
			com = new Comment_DeleteCommand();
		} else if (sp.equalsIgnoreCase("/notice_filedownload.do")) {
			com = new Notice_FileDownloadCommand();
		} 
	
		
		if (com != null) {
			Notice_CommandAction action = com.execute(request, response);
			if (action.isReDirect()) {
				response.sendRedirect(action.getWhere());
			} else {
				request.getRequestDispatcher(action.getWhere()).forward(request, response);
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
