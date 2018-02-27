package com.tekvizion.hcs.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Properties;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tekvizion.hcs.modal.Users;
import com.tekvizion.hcs.service.UsersService;
import com.tekvizion.hcs.util.DeniedPageErrorMessageConst;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger("rootLogger");
	
	@Autowired
	private UsersService usersService;
	
	@Autowired
	private MessageSource messageSource;
	
	@Resource(name="propertiesFile")
	private Properties myProperties;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("message", this.messageSource.getMessage("message.sample", null, null) );
		
		return "home";
	}
	
	/**
	 * Method to load the home page
	 * @param locale
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String getHome(Locale locale, Model model) {
		logger.info("Loading home page");
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("message", this.messageSource.getMessage("message.sample", null, null) );
		return "home";
	}
	
	
	/**
	 * Method to load the login page by default
	 * @param locale
	 * @param redAttr
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public  ModelAndView login(Locale locale,RedirectAttributes redAttr) {
		ModelAndView modelAndView=new ModelAndView();
		Users userObj = this.usersService.getAuthenticatedUser();
		if(userObj==null){
			
			return new ModelAndView(myProperties.containsKey("app.settings.sso.url")==true?"redirect:"+myProperties.getProperty("app.settings.sso.url"):"login");
			
/*			logger.info(" - Loding login page...!");
			modelAndView.setViewName("login");
			return modelAndView;*/
		}
		else{
			logger.info(userObj.getName()+" - User already logged in...! Loading dashboard.");
			modelAndView.setViewName("redirect:welcome");
			return modelAndView;
		}
	}

	
	/**
	 * Method to load the login page on error in login validation
	 * @param locale
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/loginError", method = RequestMethod.GET)
	public String loginError(Locale locale, Model model) {
		model.addAttribute("pname", "login");
		model.addAttribute("loginError", "true");		
		logger.error("Login error...! Loding login page again.");
		return "login";
	}

	/**
	 * Method to check the validation
	 * @param locale
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/denied", method = RequestMethod.GET)
	public String accessDeniedPage(Locale locale, Model model) {
		logger.info("load accessDeniedPage()method.");
		 String userName = this.usersService.getAuthenticatedUserName();
		 model.addAttribute("userName", userName);
		 model.addAttribute("headerName", "denied");
		 model.addAttribute("errorMsg", DeniedPageErrorMessageConst.DENIEDERRORMESSAGE);
		 logger.info(userName+" - accessing url was denied.");
		 return "denied";
		 
	}
	
	/**
	 * Method to load the dashboard on success full login
	 * @param locale
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public String welcome(Locale locale, Model model) {
		logger.info("User logged in Successfully...! Loading dashboard.");
		return "redirect:dashboard";
	}
	
	/**
	 * Method to load the privacy policy
	 * @param locale
	 * @return
	 */
	@RequestMapping(value = "/privacy-policy", method = RequestMethod.GET)
	public String privacyPolicy(Locale locale) {
		return "privacy-policy";
	}
	
}
