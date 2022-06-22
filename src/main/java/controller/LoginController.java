package controller;

import bean.Admin;
import bean.Reader;
import java.util.HashMap;
import service.LoginService;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;

@Controller     // 表示当前类为处理器，对象存放在SpringMVC中
public class LoginController {

    @Autowired
    private LoginService loginService;

    // 跳转登录界面
    @RequestMapping(value = {"/", "/login.html"})
    public String toLogin() {
        return "index";
    }

    // 登录验证
    @RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
    @ResponseBody   // 将java对象转为json格式的数据
    public Object loginCheck(HttpServletRequest request) {
        long id = Long.parseLong(request.getParameter("id"));       // getAttribute返回值类型是Object，parseLong将String转换成Long类型
        String passwd = request.getParameter("passwd");             // getParameter获取表单提交的数据，得到的都是String类型
        boolean isAdmin = loginService.hasMatchAdmin(id, passwd);
        boolean isReader = loginService.hasMatchReader(id, passwd);
        HashMap<String, String> res = new HashMap<>();                    // 一个函数同时需要返回多种状态时使用HashMap散列表
        if (isAdmin) {
            Admin admin = loginService.findAdmin(id);                     // 创建管理员信息对象
            request.getSession().setAttribute("admin", admin);      // 给会话赋值，通常浏览器不关闭，保存的值就不会消失
            res.put("stateCode", "1");                                    // 向res中添加状态码
            res.put("msg", "管理员登录成功！");                              // 向res中添加信息
        } else if (isReader) {
            Reader reader = loginService.findReader(id);
            request.getSession().setAttribute("reader", reader);
            res.put("stateCode", "2");
            res.put("msg", "读者登录成功！");
        } else {
            res.put("stateCode", "0");
            res.put("msg", "账号或密码错误！");
        }
        return res;
    }

    // 跳转管理员主界面
    @RequestMapping("/admin_main.html")
    public ModelAndView toAdminMain() {
        return new ModelAndView("admin_main");
    }

    // 跳转读者主界面
    @RequestMapping("/reader_main.html")
    public ModelAndView toReaderMain() {
        return new ModelAndView("reader_main");
    }

    // 配置404页面
    @RequestMapping("*")
    public String notFind() {
        return "404";
    }

}