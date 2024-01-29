package och01;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Board
 */
public class Board extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Board() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title"); // String타입 title변수에 html 파라미터 name값 title을 찾아 넣는다.
		String writer = request.getParameter("writer"); // String타입 writer변수에 html 파라미터 name값 writer를 찾아 넣는다.
		String content = request.getParameter("content"); // String타입 content변수에 html 파라미터 name값 content를 찾아 넣는다.
		Date date = new Date(); // Date라이브러리의 객체를 Date타입 date변수에 넣는다.
		request.setCharacterEncoding("utf-8"); // 클라이언트에서 서버로 보내는 요청의 문자 인코딩을 UTF-8로 설정
		response.setContentType("text/html;charset=utf-8"); // 서버에서 클라이언트로 보내는 컨텐츠 타입을 html로 문자 인코딩 utf-8로 설정
		PrintWriter out = response.getWriter(); // PrintWriter타입의 out변수에 파라미터 response의 getWriter메서드를 통해 아래의 코드를 html에 출력한다.
		out.printf("<html><body>");
		out.printf("<h1>게시판</h1>");
		out.printf("제목 : %s<br>", title);
		out.printf("작성자 : %s<br>", writer);
		out.printf("<p>작성일: %s</p>", date.toString());
		out.printf("<p>내용</p>");
		out.printf("<p>%s</p>", content);
		out.printf("</body></html>");
	}

}

/*
게시판
제목 : 안시성
작성자 : 양만춘

작성일 : Tue Jan 16 14:44:13 KST 2024

내용

당태종 체포
*/