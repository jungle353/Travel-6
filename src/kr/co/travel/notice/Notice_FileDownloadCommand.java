package kr.co.travel.notice;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Notice_FileDownloadCommand implements Notice_Command {

	@Override
	public Notice_CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String sNum = request.getParameter("num");
		int num = -1;
		if (sNum != null) {
			num = Integer.parseInt(sNum);
		}
		
		NoticeDTO dto = new NoticeDAO().read(num);
		
		
		String filename = dto.getFilename();
		
		String uploadFileName = request.getRealPath("/upload") + "/" + filename;
		
		File downFile = new File(uploadFileName);
		
        if (downFile.exists() && downFile.isFile()) {
        	 
            try {

            	long filesize = downFile.length();

                response.setContentType("application/x-msdownload");
                response.setContentLength((int) filesize);
                String strClient = request.getHeader("user-agent");
 
                if (strClient.indexOf("MSIE 5.5") != -1) {
                    response.setHeader("Content-Disposition", "filename="
                            + filename + ";");
                } else {
                    response.setHeader("Content-Disposition",
                            "attachment; filename=" + filename + ";");
                }
                response.setHeader("Content-Length", String.valueOf(filesize));
                response.setHeader("Content-Transfer-Encoding", "binary;");
                response.setHeader("Pragma", "no-cache");
                response.setHeader("Cache-Control", "private");
 
                byte b[] = new byte[1024];
 
                BufferedInputStream fin = new BufferedInputStream(
                        new FileInputStream(downFile));
 
                BufferedOutputStream outs = new BufferedOutputStream(
                        response.getOutputStream());
 
                int read = 0;
 
                while ((read = fin.read(b)) != -1) {
                    outs.write(b, 0, read);
                }
                outs.flush();
                outs.close();
                fin.close();
            } catch (Exception e) {
                System.out.println("Download Exception : " + e.getMessage());
            }
        } else {
            System.out.println("Download Error : downFile Error [" + downFile
                    + "]");
        }
		
		return new Notice_CommandAction(true, "notice_read.do?num="+num);
	}

}
