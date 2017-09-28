package com.iot1.sql.common.controller.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UrlController {

	@RequestMapping(value="/url/{url}",method=RequestMethod.GET)
	public String getUrl(@PathVariable(value="url") String url){//{url} 은 String url에 대입시키는것.
		url = url.replace(":","/");
		return url;
	}
}
