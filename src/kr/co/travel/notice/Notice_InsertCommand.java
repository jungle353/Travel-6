package kr.co.travel.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Notice_InsertCommand implements Notice_Command {

	@Override
	public Notice_CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writeday = request.getParameter("writeday");
		NoticeDAO dao = new NoticeDAO();
		NoticeDTO dto = new NoticeDTO(-1, writer, title, content, writeday, -1);
		dao.insert(dto);
		
//		for(int i=0;i<100;i++) {
//			dao.insert(new NoticeDTO(-1, "writer"+i,  "title"+i, "content"+i, null, 0));
//			try {
//				Thread.sleep(50); //0.05초마다 멈춤. 너무 빠른 속도로 인해 일어나는 에러 방지
//			} catch (InterruptedException e) {
//				e.printStackTrace();
//			}
//		}
		
		return new Notice_CommandAction(true, "notice_list.do");
	}

}
