package kr.or.dw.admin.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.dw.admin.service.AdminServiceImpl;
import kr.or.dw.admin.service.IAdminService;
import kr.or.dw.web.IAction;

public class DeleteAdminAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		IAdminService service = AdminServiceImpl.getInstance();
		service.adminDelete(Integer.parseInt(req.getParameter("u_no")));
		req.setAttribute("u_no", req.getParameter("u_no"));
		return "/admin/deleteSuccess.jsp";
		
		
		
		
		
	}

	
}
