package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.framework.Controller;

public class ReviewWriteFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request,
					HttpServletResponse response) throws Exception {

		
		
		return "/feane-1.0.0/writeReview.html";
	}
}
