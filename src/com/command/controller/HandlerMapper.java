package com.command.controller;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.Set;

import com.command.action.Action;
import com.command.context.ApplicationContext;

public class HandlerMapper {

	private Map<String, Action> commandMap = new HashMap<String, Action>();
	private String PROPERTY_PATH = "com/jsp/properties/url";

	public HandlerMapper() throws Exception {
		this("com/jsp/properties/url");
	}

	public HandlerMapper(String path) throws Exception {
		this.PROPERTY_PATH = path;

		ResourceBundle rbHome = ResourceBundle.getBundle(path);
		Set<String> actionSetHome = rbHome.keySet(); // uri set
		Iterator<String> it = actionSetHome.iterator();

		while (it.hasNext()) {
			String command = it.next(); // key -> url

			String actionClassName = rbHome.getString(command);

			Class<?> actionClass = Class.forName(actionClassName);
			Action commandAction = (Action) actionClass.newInstance();

			System.out.println(commandAction);

			// 의존주입(service, dao.......)
			// 의존성 확인 및 조립
			Method[] methods = actionClass.getMethods();
			for (Method method : methods) {
				if (method.getName().indexOf("set") == 0) {

					// setter parameter type으로 주입기준
					String paramName = method.getParameterTypes()[0].getName();
					paramName = paramName.substring(paramName.lastIndexOf(".") + 1);
					paramName = (paramName.charAt(0) + "").toLowerCase() + paramName.substring(1);

					method.invoke(commandAction, ApplicationContext.getApplicationContext().get(paramName));
					System.out.println("[HandlerMapper:invoke]" + actionClassName + ":"
							+ ApplicationContext.getApplicationContext().get(paramName));
				}
			}

			// container 구성
			commandMap.put(command, commandAction);
			System.out.println("[HandlerMapper] url:" + command + "\tAction:" + commandAction);

		}
	}

	public Action getAction(String url) {
		Action action = commandMap.get(url);
		return action;
	}
}
