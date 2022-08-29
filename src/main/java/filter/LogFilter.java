package filter;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;
import java.util.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

//web.xml부분에 없애고 바로 @WebFilter("필터적용시킬파일") 해서지정해줘도 됨
@WebFilter("/*")
public class LogFilter implements Filter {
	//init() : 필터객체의 초기화 메서드 , 객체 생성 후 한번만 실행
	//FilterConfig : web.xml의 매개변수들(init-param)과 필터에대한 정보를 가짐
	public void init(FilterConfig config) throws ServletException{
		System.out.println("WebMarket 초기화....");
	}
	
	
	//ServletRequest : 들어오는 것들
	//ServletResponse : 전달할 응답
	//FilterChain : 필터가 여러개 모여서 하나의 체인을 이룸. 필터의 흐름제어, 다음필터호출
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		//request.getRemoteAddr() : 클라이언트의 IP를 가져옴
		System.out.println("접속한 클라이언트 IP : " + request.getRemoteAddr());
		//System.currentTimeMillils() : 현재 시간을 ms단위로 가져옴 
		long start = System.currentTimeMillis();
		//request.getRequestURL()로 대체못하나?
		System.out.println("접근한 URL 경로 : " + getURLPath(request));
		System.out.println("요청 처리 시작 시각 : " + getCurrentTime());
		
		//doFilter 전의 내용은 필터를 거치기전, 후의 내용은 거친 후이다.
		//chain.doFilter : 다음필터나 서블릿을 호출하고 돌아온다.
		//?? 이 페이지에는 다른페이지로 이동하라는 코드가 없는데, 그말은 즉 필터는 개별적으로 존재하고 자기일을 하는 영역인가?
		chain.doFilter(request, response);
		
		long end = System.currentTimeMillis();
		System.out.println("요청 처리 종료 시각 : " + getCurrentTime());
		System.out.println("요청 처리 소요 시간 : " + (end-start)+"ms ");
		System.out.println("=================================================================");
	}
	
	//destroy : 서블릿 다 사용하고난 뒤 소멸
	public void destroy() {
		System.out.println("서블릿 destroy");
	}
	
	private String getURLPath(ServletRequest request) {
		HttpServletRequest req;
		String currentPath="";
		String queryString = "";
		
		//a instanceof b : a는 b를 상속받는가?
		//??왜 상속여부를 확인하는거지? ServletRequest는 HttpServletRequest을 상속받은 상태가 아닌가?
		//request.getParameter로 받아올때 사용하는 내장객체는 HttpServletRequest인가?
		if(request instanceof HttpServletRequest) {
			//??형변환이 가능한 이유는?
			req = (HttpServletRequest)request;
			//getRequestURI : 웹브라우저가 요청한 URI경로를 가져옴
			currentPath = req.getRequestURI();
			//getQueryString : url에서 ?다음 내용을 가져옴
			queryString = req.getQueryString();
			//queryString에서 가져온 값이 null이 아니면 앞에?를 붙임
			queryString = queryString == null ? "" : "?" + queryString;
		}
		
		return currentPath + queryString;
	}
	
	private String getCurrentTime() {
		DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());
		return formatter.format(calendar.getTime());
	}

}
