package kr.co.travel.notice;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Notice_InsertCommand implements Notice_Command {

	@Override
	public Notice_CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ServletContext context = request.getSession().getServletContext();
		String savePath = context.getRealPath("Upload");
		int sizeLimit = 1 * 1024 * 1024;
		MultipartRequest multipartRequest = null;

		try {
			multipartRequest = new MultipartRequest(request, savePath, sizeLimit, "UTF-8",
					new DefaultFileRenamePolicy());
		} catch (IOException e) {
			e.printStackTrace();
		}

		String filename = multipartRequest.getFilesystemName("filename");
		String writer = multipartRequest.getParameter("writer");
		String title = multipartRequest.getParameter("title");
		String content = multipartRequest.getParameter("content");
		String writeday = multipartRequest.getParameter("writeday");
		
		NoticeDAO dao = new NoticeDAO();
		NoticeDTO dto = new NoticeDTO(-1, writer, title, content, writeday, -1, filename);
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
