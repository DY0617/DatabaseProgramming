


package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {
    @GetMapping("hello")
    public String hello(Model model) {
        model.addAttribute("name", "황동엽");
        model.addAttribute("dept", "컴퓨터공학과");
        return "hello";
    }


    @GetMapping("hello-mvc")
    public String helloMvc(@RequestParam("name") String name, String dept, int year, Model model) {
        model.addAttribute("name", name);
        model.addAttribute("dept", dept);
        model.addAttribute("year", year);
        return "hello-template";
    }

    @GetMapping("hello-string")
    @ResponseBody
    public String helloString(@RequestParam("name") String name, @RequestParam("dept") String dept, @RequestParam("year") int year) {
        return "안녕하세요. 제 이름은 " + name + " 입니다. 소속은 " + dept + "이고, 학년은 " + year + "학년 입니다.";
    }

    @GetMapping("hello-api")
    @ResponseBody
    public Hello helloAPi(@RequestParam("name") String name, @RequestParam("dept") String dept, @RequestParam("year") int year) {
        Hello hello = new Hello();
        hello.setName(name);
        hello.setDept(dept);
        hello.setYear(year);
        return hello;
    }

    static class Hello {
        private String name;
        private String dept;
        private int year;

        public String getName() {
            return name;
        }
        public String getDept() {
            return dept;
        }
        public int getYear() {
            return year;
        }
        public void setName(String name) {
            this.name = name;
        }
        public void setDept(String dept) {
            this.dept = dept;
        }
        public void setYear(int year) {
            this.year = year;
        }


    }
}


