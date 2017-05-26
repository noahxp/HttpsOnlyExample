package tw.noah;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * http 的 request ，一律導到 https
 */
public class HttpsOnlyFilter implements Filter {
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}
	
	@Override
	public void destroy() {

	}

	/**
	 * post 因要處理參數麻煩，所以直接導到首頁(或某個想導的地方)，其他來自 http 的就一律導到 https
	 */ 
	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
	
		
		if (request.getHeader("x-forwarded-proto")!=null && request.getHeader("x-forwarded-proto").equals("http")){  // 來自 http 的 request 要處理，無法判斷不處理，避免造成鬼打牆
			String url = "https://" + request.getServerName() + request.getRequestURI();
			String queryString = "";
			if (request.getMethod().equals("GET")){
				if (request.getQueryString()!=null && request.getQueryString().length()>0){
					queryString = "?" + request.getQueryString();
				}
			}else{	// post 來的，一律導回首頁，避免參數短少的鬼打牆
				url = "https://" + request.getServerName();
			}
			response.sendRedirect(url + queryString);
			return;
		}
		filterChain.doFilter(request, response);
	}



}
