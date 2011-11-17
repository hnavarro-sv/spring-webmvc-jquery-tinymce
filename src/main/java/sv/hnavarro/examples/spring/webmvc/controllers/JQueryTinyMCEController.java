package sv.hnavarro.examples.spring.webmvc.controllers;

import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller("jqueryTinyMCEController")
public class JQueryTinyMCEController {

	private Logger log = Logger.getLogger(this.getClass());

	@RequestMapping(value = "/jquerytinymce", method = RequestMethod.GET)
	public ModelAndView jquerytinymce(ModelAndView modelAndView) {
		String message = "<a title='hnavarro-sv.blogspot.com' href='http://hnavarro-sv.blogspot.com/' target='_blank'>Spring Web MVC, jQuery y TinyMCE by http://hnavarro-sv.blogspot.com/</a>";
		modelAndView.addObject("message", message);
		modelAndView.setViewName("jquerytinymce");
		log.debug("Solicita: " + message);
		return modelAndView;
	}

	@RequestMapping(value = "/notas", method = RequestMethod.POST)
	public @ResponseBody String procesar(
			@RequestParam(value = "notas", required = true) String notas,
			Model model) {
		log.debug("Procesar: " + notas);
		return (new Date()).toString();
	}


}