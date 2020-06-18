package kr.co.travel.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Notice_ReadCommand implements Notice_Command {

	@Override
	public Notice_CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String sNum = request.getParameter("num");
		int num = -1;
		if (sNum != null) {
			num = Integer.parseInt(sNum);
		}

		NoticeDAO dao = new NoticeDAO();
		NoticeDTO dto = dao.read(num);

		List<CommentDTO> cList = dao.cList(num); // 댓글 목록 가져오기

		request.setAttribute("dto", dto);
		request.setAttribute("cList", cList);
		
		return new Notice_CommandAction(false, "notice_read.jsp");

	}

}
