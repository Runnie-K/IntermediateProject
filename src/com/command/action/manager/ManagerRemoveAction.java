package com.command.action.manager;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.action.Action;
import com.command.dto.ManagerVO;
import com.command.service.ManagerService;

public class ManagerRemoveAction implements Action {

	private ManagerService managerService;

	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String id = request.getParameter("id");
		String url = "/WEB-INF/views/manager/remove_success.jsp";

		try {
			managerService.remove(id);

			HttpSession session = request.getSession();
			ManagerVO loginUser = (ManagerVO) session.getAttribute("loginUser");
			if (loginUser != null && id.equals(loginUser.getManagerId())) {
				session.invalidate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return url;
	}

}
