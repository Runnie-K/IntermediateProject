package com.command.action.manager;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.action.Action;
import com.command.dto.ManagerVO;
import com.command.service.ManagerService;

public class ManagerModifyAction implements Action {

	private ManagerService managerService;

	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "redirect:/member/detail.do?id=";

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		ManagerVO manager = new ManagerVO();
		manager.setManagerId(id);
		manager.setManagerPw(pw);

		try {
			managerService.modify(manager);

			HttpSession session = request.getSession();
			ManagerVO loginUser = (ManagerVO) session.getAttribute("loginUser");
			if (loginUser != null && manager.getManagerId().equals(loginUser.getManagerId())) {
				ManagerVO targetObj = managerService.getManager(id);
				session.setAttribute("loginUser", targetObj);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return url;
	}

}
