package controller;

import bean.Reader;
import bean.ReaderInfo;
import service.LoginService;
import service.ReaderService;
import service.ReaderInfoService;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ReaderController {

    @Autowired
    private ReaderService readerService;

    @Autowired
    private ReaderInfoService readerInfoService;

    @Autowired
    private LoginService loginService;

    // 获取页面填写的读者信息
    private ReaderInfo getReaderInfo(long reader_id, String name, String sex, String company, String type, String level) {
        ReaderInfo readerInfo = new ReaderInfo();
        readerInfo.setReader_id(reader_id);
        readerInfo.setName(name);
        readerInfo.setSex(sex);
        readerInfo.setCompany(company);
        readerInfo.setType(type);
        readerInfo.setLevel(level);
        return readerInfo;
    }

    // 跳转读者查看个人信息页面
    @RequestMapping("/reader_info.html")
    public ModelAndView toReaderInfo(HttpServletRequest request) {
        //前面登录验证时使用了setAttribute(),获取数据要用getAttribute()
        Reader reader = (Reader) request.getSession().getAttribute("reader");       // 获取页面读者信息(账号，用户名，密码)
        ReaderInfo readerInfo = readerInfoService.getReaderInfo(reader.getReader_id());   // 根据读者id查找个人信息
        ModelAndView modelAndView = new ModelAndView("reader_info");
        modelAndView.addObject("readerinfo", readerInfo);                    // 向视图中添加读者个人信息
        return modelAndView;
    }

    // 跳转读者修改个人信息页面
    @RequestMapping("/reader_info_edit.html")
    public ModelAndView readerInfoEditReader(HttpServletRequest request) {
        Reader reader = (Reader) request.getSession().getAttribute("reader");
        ReaderInfo readerInfo = readerInfoService.getReaderInfo(reader.getReader_id());
        ModelAndView modelAndView = new ModelAndView("reader_info_edit");
        modelAndView.addObject("readerinfo", readerInfo);
        return modelAndView;
    }

    // 读者修改个人信息
    @RequestMapping("/reader_info_edit_rdo.html")
    public String readerInfoEditDoReader(HttpServletRequest request, String name, String sex, String company, String type, String level, RedirectAttributes redirectAttributes) {
        Reader reader = (Reader) request.getSession().getAttribute("reader");
        ReaderInfo readerInfoNew = getReaderInfo(reader.getReader_id(), name, sex, company, type, level);      // 获取页面修改的信息
        if (readerInfoService.editReaderInfo(readerInfoNew) && readerInfoService.editReader(readerInfoNew)) {     // 修改读者个人信息和登录信息
            Reader readerNew = loginService.findReader(reader.getReader_id());//
            request.getSession().setAttribute("reader", readerNew);//
            redirectAttributes.addFlashAttribute("succ", "信息修改成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "信息修改失败！");
        }
        return "redirect:/reader_info.html";
    }

    // 跳转读者修改密码界面
    @RequestMapping("/reader_repasswd.html")
    public ModelAndView resetReaderPasswd() {
        return new ModelAndView("reader_repasswd");
    }

    // 读者修改密码
    @RequestMapping("/reader_repasswd_do")
    public String resetReaderPasswdDo(HttpServletRequest request, String oldPasswd, String newPasswd, RedirectAttributes redirectAttributes) {
        Reader reader = (Reader) request.getSession().getAttribute("reader");
        long id = reader.getReader_id();
        String password = readerService.getReaderPassword(id);
        if (password.equals(oldPasswd)) {                                                  // 判断密码是否与旧密码相同
            if (readerService.resetPassword(id, newPasswd)) {                              // 相同则修改密码
                redirectAttributes.addFlashAttribute("succ", "密码修改成功！");
                return "redirect:/reader_repasswd.html";
            } else {
                redirectAttributes.addFlashAttribute("error", "密码修改失败！");
                return "redirect:/reader_repasswd.html";
            }
        } else {
            redirectAttributes.addFlashAttribute("error", "旧密码错误！");
            return "redirect:/reader_repasswd.html";
        }
    }

    // 管理员查看所有读者信息
    @RequestMapping("/allreaders.html")
    public ModelAndView allReaders() {
        ArrayList<ReaderInfo> readers = readerInfoService.readerInfos();
        ModelAndView modelAndView = new ModelAndView("admin_readers");
        modelAndView.addObject("readers", readers);
        return modelAndView;
    }

    // 跳转管理员添加读者页面
    @RequestMapping("/reader_add.html")
    public ModelAndView readerAdd() {
        return new ModelAndView("admin_reader_add");
    }

    // 管理员添加读者
    @RequestMapping("/reader_add_do.html")
    public String readerAddDo(String name, String sex, String company, String type, String level, String password, int money, RedirectAttributes redirectAttributes) {
        ReaderInfo readerInfoNew = getReaderInfo(0, name, sex, company, type, level);
        long reader_id = readerInfoService.addReaderInfo(readerInfoNew);                   // 查找出自动生成的读者id
        readerInfoNew.setReader_id(reader_id);                                             // 将读者id添入读者信息
        if (reader_id > 0 && readerService.addReader(readerInfoNew, password, money)) {           // 读者存在
            redirectAttributes.addFlashAttribute("succ", "添加读者信息成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "添加读者信息失败！");
        }
        return "redirect:/allreaders.html";
    }

    // 管理员删除读者
    @RequestMapping("/reader_delete.html")
    public String readerDelete(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        // 不可使用 long reader_id = (Long) request.getSession().getAttribute("reader_id");
        long reader_id = Long.parseLong(request.getParameter("reader_id"));
        if (readerInfoService.deleteReaderInfo(reader_id) && readerService.deleteReader(reader_id)) {
            redirectAttributes.addFlashAttribute("succ", "删除成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "删除失败！");
        }
        return "redirect:/allreaders.html";
    }

    // 跳转管理员修改读者信息页面
    @RequestMapping("/admin_readerinfo_edit.html")
    public ModelAndView readerInfoEdit(HttpServletRequest request) {
        long reader_id = Long.parseLong(request.getParameter("reader_id"));
        ReaderInfo readerInfo = readerInfoService.getReaderInfo(reader_id);
        ModelAndView modelAndView = new ModelAndView("admin_reader_edit");
        modelAndView.addObject("readerInfo", readerInfo);
        return modelAndView;
    }

    // 管理员修改读者信息
    @RequestMapping("/reader_info_edit_ado.html")
    public String readerInfoEditDo(HttpServletRequest request, String name, String sex, String company, String type, String level, RedirectAttributes redirectAttributes) {
        long reader_id = Long.parseLong(request.getParameter("reader_id"));
        ReaderInfo readerInfoNew = getReaderInfo(reader_id, name, sex, company, type, level);
        if (readerInfoService.editReaderInfo(readerInfoNew) && readerInfoService.editReader(readerInfoNew)) {
            redirectAttributes.addFlashAttribute("succ", "读者信息修改成功！");
        } else {
            redirectAttributes.addFlashAttribute("error", "读者信息修改失败！");
        }
        return "redirect:/allreaders.html";
    }

}