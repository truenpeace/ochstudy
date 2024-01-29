package och06; // 패키지 이름을 정의합니다.

import java.io.IOException; // 입출력 예외 처리를 위한 클래스를 가져옵니다.
import java.io.PrintWriter; // 파일에 문자를 쓰기 위한 클래스를 가져옵니다.
import java.math.BigInteger; // 큰 정수를 처리하기 위한 클래스를 가져옵니다.

import jakarta.servlet.Servlet; // 서블릿 인터페이스를 가져옵니다.
import jakarta.servlet.ServletConfig; // 서블릿 설정을 위한 인터페이스를 가져옵니다.
import jakarta.servlet.ServletException; // 서블릿 예외 처리를 위한 클래스를 가져옵니다.
import jakarta.servlet.http.HttpServlet; // HTTP 서블릿을 위한 클래스를 가져옵니다.
import jakarta.servlet.http.HttpServletRequest; // HTTP 요청을 위한 인터페이스를 가져옵니다.
import jakarta.servlet.http.HttpServletResponse; // HTTP 응답을 위한 인터페이스를 가져옵니다.

/**
 * Servlet implementation class Fibonazzi
 */
public class Fibonazzi extends HttpServlet { // HttpServlet 클래스를 상속받는 Fibonazzi 클래스를 정의합니다.
	private static final long serialVersionUID = 1L; // 직렬화를 위한 버전 ID를 정의합니다.
    BigInteger[] arr = new BigInteger[100]; // 피보나치 수열을 저장할 배열을 선언합니다.

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fibonazzi() {
        super(); // 부모 클래스의 생성자를 호출합니다.
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException { // 서블릿이 처음 생성될 때 호출되는 메소드입니다.
		System.out.println("Fibonazzi init..."); // 초기화 메시지를 출력합니다.
		arr[0] = new BigInteger("1"); // 피보나치 수열의 첫 번째 항을 설정합니다.
		arr[1] = new BigInteger("1"); // 피보나치 수열의 두 번째 항을 설정합니다.
		for (int i = 2; i < arr.length; i++) { // 피보나치 수열의 나머지 항을 계산합니다.
			arr[i] = arr[i - 2].add(arr[i - 1]); // 각 항은 이전 두 항의 합입니다.
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { // HTTP GET 요청을 처리하는 메소드입니다.
		System.out.println("Fibonazzi doget..."); // 메소드 시작 메시지를 출력합니다.
		int num = Integer.parseInt(request.getParameter("num")); // 요청에서 "num" 파라미터를 가져와 정수로 변환합니다.
		if (num > 100)		num = 100; // num이 100보다 크면, num을 100으로 설정합니다.
		response.setContentType("text/html;charset=utf-8"); // 응답의 컨텐츠 타입을 설정합니다.
		PrintWriter out = response.getWriter(); // 응답을 위한 PrintWriter 객체를 가져옵니다.
		out.println("<html><body><h2>피보나찌수열</h2>"); // HTML 문서를 생성하고, 제목을 출력합니다.
		for (int i = 0; i < num; i++) { // num개의 피보나치 수를 출력합니다.
			out.println(arr[i] + "<br>"); // 각 피보나치 수를 출력합니다.
		}
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
