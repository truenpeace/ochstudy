package och06; // 패키지 이름을 정의합니다.

import java.io.FileWriter; // 파일에 문자를 쓰기 위한 클래스를 가져옵니다.
import java.io.IOException; // 입출력 예외 처리를 위한 클래스를 가져옵니다.
import java.io.PrintWriter; // 파일에 문자를 쓰기 위한 클래스를 가져옵니다.
import java.util.GregorianCalendar; // 그레고리안 달력을 사용하기 위한 클래스를 가져옵니다.

import jakarta.servlet.Servlet; // 서블릿 인터페이스를 가져옵니다.
import jakarta.servlet.ServletConfig; // 서블릿 설정을 위한 인터페이스를 가져옵니다.
import jakarta.servlet.ServletException; // 서블릿 예외 처리를 위한 클래스를 가져옵니다.
import jakarta.servlet.http.HttpServlet; // HTTP 서블릿을 위한 클래스를 가져옵니다.
import jakarta.servlet.http.HttpServletRequest; // HTTP 요청을 위한 인터페이스를 가져옵니다.
import jakarta.servlet.http.HttpServletResponse; // HTTP 응답을 위한 인터페이스를 가져옵니다.

/**
 * Servlet implementation class Greet
 */
public class Greet extends HttpServlet { // HttpServlet 클래스를 상속받는 Greet 클래스를 정의합니다.
	private static final long serialVersionUID = 1L; // 직렬화를 위한 버전 ID를 정의합니다.
    PrintWriter log; // PrintWriter 객체를 선언합니다.

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Greet() {
        super(); // 부모 클래스의 생성자를 호출합니다.
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException { // 서블릿이 처음 생성될 때 호출되는 메소드입니다.
		System.out.println("init start..."); // 서버에 올라갈 때 1번만 실행
		try {
			log = new PrintWriter(new FileWriter("c:/log/log.txt", true)); // 로그 파일을 생성하고 PrintWriter 객체를 초기화합니다.
		} catch (IOException e) { // 입출력 예외가 발생하면,
			// TODO Auto-generated catch block
			e.printStackTrace(); // 예외의 스택 추적을 출력합니다.
			System.out.println("헐 !"); // 에러 메시지를 출력합니다.
		}
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() { // 서블릿이 메모리에서 제거될 때 호출되는 메소드입니다.
		System.out.println("destory start..."); // 서버에 종료될 때 1번 실행
		log.flush(); // 지금까지 입력되었던 것을 한번에 저장
		// 유언장
		if (log != null) log.close(); // PrintWriter 객체가 null이 아니면, 객체를 닫습니다.
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { // HTTP GET 요청을 처리하는 메소드입니다.
		System.out.println("doGet start...");
		String name = request.getParameter("name"); // 요청에서 "name" 파라미터를 가져옵니다.
		String msg = name + "님 반가워\r\n"; // 인사 메시지를 생성합니다.
		GregorianCalendar gc = new GregorianCalendar(); // 그레고리안 달력 객체를 생성합니다.
		String date = String.format("%TF %TT\r\n", gc, gc); // 날짜와 시간을 문자열로 변환합니다.
		// File 출력 --> date + msg
		log.print(date + msg); // 로그 파일에 날짜와 메시지를 출력합니다.
		response.setContentType("text/html;charset=utf-8"); // 응답의 컨텐츠 타입을 설정합니다.
		PrintWriter out = response.getWriter(); // 응답을 위한 PrintWriter 객체를 가져옵니다.
		// 화면 출력 --> msg
		out.println("<html><body><h2>인사</h2>"+msg); // HTML 문서를 생성하고, 메시지를 출력합니다.
		out.println("</body></html>"); // HTML 문서를 닫습니다.
		out.close(); // PrintWriter 객체를 닫습니다.
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { // HTTP POST 요청을 처리하는 메소드입니다.
		// TODO Auto-generated method stub
		doGet(request, response); // POST 요청을 GET 요청으로 처리합니다.
	}

}
