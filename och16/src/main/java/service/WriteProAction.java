package service;

import java.io.IOException;

import dao.Board;
import dao.BoardDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class WriteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("WriteProAction Start...");
		
		try {
			// 1. num , pageNum, writer ,  email , subject , passwd , content   Get
			// 2. Board board 생성하고 DTO Value Setting
			request.setCharacterEncoding("utf-8");
			String pageNum = request.getParameter("pageNum");
			System.out.println("WriteProAction pageNum->"+pageNum);
			
			Board board = new Board();
			board.setNum(Integer.parseInt(request.getParameter("num")));
			board.setWriter(request.getParameter("writer"));
			board.setSubject(request.getParameter("subject"));
			board.setContent(request.getParameter("content"));
			board.setEmail(request.getParameter("email"));
			board.setPasswd(request.getParameter("passwd"));
			board.setRef(Integer.parseInt(request.getParameter("ref")));
			board.setRe_step(Integer.parseInt(request.getParameter("re_step")));
			board.setRe_level(Integer.parseInt(request.getParameter("re_level")));
			board.setIp(request.getRemoteAddr());
			
			// 3. BoardDao bd Instance
			BoardDao bd = BoardDao.getInstance(); // DB
	        int result = bd.insert(board);
	        
	        // 4. request 객체에 result, num , pageNum
	        request.setAttribute("num", board.getNum());
	        request.setAttribute("result", result);
	        request.setAttribute("pageNum", pageNum);
	        
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

        return "writePro.jsp";
		
	}

}
