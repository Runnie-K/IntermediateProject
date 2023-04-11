package com.command.action.manager;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.action.Action;
import com.command.dto.ManagerVO;
import com.command.service.ManagerService;

public class ManagerRegistAction implements Action {

	private ManagerService managerService;

	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String url = "/WEB-INF/views/manager/regist_success.jsp";

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		ManagerVO manager = new ManagerVO();
		manager.setManagerId(id);
		manager.setManagerPw(pw);

		try {
			managerService.regist(manager);
			System.out.println("service 실행댐");
		} catch (

		SQLException e) {
			System.out.println("오류남");
			e.printStackTrace();
		}

		return url;
	}

}
