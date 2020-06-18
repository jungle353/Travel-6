package kr.co.travel.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Notice_Command {
	Notice_CommandAction execute (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
