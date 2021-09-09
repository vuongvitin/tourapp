/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controllers;

import com.mycompany.utils.Utils;
import com.mycompany.pojos.Cart;
import com.mycompany.service.CategoryService;
import com.mycompany.service.ProductService;
import java.util.Map;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.provisioning.UserDetailsManager;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author PC
 */
@Controller
@ControllerAdvice
public class HomeController {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ProductService productService;
    
    @ModelAttribute
    public void commonAttr(Model model, HttpSession session){
        model.addAttribute("categories", this.categoryService.getCategories());
         model.addAttribute("cartCounter", Utils.countCart((Map<Integer, Cart>) session.getAttribute("cart")));
    }
    

    @RequestMapping("/")
    @Transactional
    public String index(Model model, 
            @RequestParam(required = false) Map<String, String> params
            ) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("products", this.productService.getProducts(params.get("kw"), page));
        model.addAttribute("counter", this.productService.countProduct());
        
        return "index";
    }
    
    @RequestMapping(path = "/cart")
    public String cart(Model model) {
        return "cart";
    }
   

//    @RequestMapping("/")
//    public String index(Model model){          
//            model.addAttribute("name", "VUONGTRAN"); 
//            
//            model.addAttribute("user", new User());
//            
//            List<User> users = new ArrayList<>();
//            users.add(new User("Nam", "Nguyen"));
//            users.add(new User("Binh", "Le"));
//            
//            model.addAttribute("users", users);
//
//        return "index";
//    }
    
//    @RequestMapping(path = "/hello-post", method = RequestMethod.POST)
//    public String show(Model model,
//            @ModelAttribute(value = "user") User user) {
//        model.addAttribute("fullName", user.getFirstname() + " " + user.getLastname());
//
//        return "index";
//    }


//    @GetMapping(params = "/param")
//    public String index(Model model,
//            @RequestParam(required = true) Map<String, String> params) {
//        String firstname = params.get("first_name");
//        String lastname = params.get("last_name");
//        if (firstname != null & lastname != null) {
//            model.addAttribute("name", String.format("%s %s", firstname, lastname));
//        } else {
//            model.addAttribute("name", "VUONG");
//        }
//
//        return "index";
//    }

    @RequestMapping("/hello/{name}")
    public String hello(Model model,
            @PathVariable(value = "name") String name) {
        model.addAttribute("message", "Welcome " + name + " !!");

        return "hello";
    }

    @RequestMapping(path = "/test")
    public String testRedirect(Model model) {
        model.addAttribute("testMsg", "WELCOME REDIRECT");

        return "forward:hello/Vuong";
    }
    
}
