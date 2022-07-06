package com.cqcet.phone.website.web;

import com.cqcet.phone.website.pojo.*;
import com.cqcet.phone.website.service.AdminService;
import com.cqcet.phone.website.service.BusinessService;
import com.cqcet.phone.website.service.CustomerService;
import com.cqcet.phone.website.service.KindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private KindService kindService;
    @Autowired
    private BusinessService businessService;

    /**
     * 管理员登录
     * @param userName 用户名
     * @param password 密码
     * @return 成功跳转到后台主页；失败跳转到登录页面
     */
    @PostMapping("/login.do")
    public ModelAndView login(String userName, String password){
        //创建ModelAndView对象
        ModelAndView mv = new ModelAndView();
        Admin admin = adminService.login(userName,password);
        if (admin != null){
            mv.addObject("admin",admin);
            mv.setViewName("admin/home");
        }else {
            mv.addObject("msg","用户名或密码错误!");
            mv.setViewName("/login");
        }
        return mv;
    }

    /**
     * 获取某个顾客对象的值
     * @param id 顾客编号
     * @param userName 姓名
     * @param tel 电话
     * @param bid 业务名
     * @return 返回List<Customer>的json数据格式
     */
    @PostMapping("/getCusInfo.do")
    @ResponseBody
    public ModelAndView getCusInfo(String id,String userName,String tel,String bid){
        //创建ModelAndView对象
        ModelAndView mv = new ModelAndView();

        //创建All对象集合
        List<AllInfo> allInfos = new ArrayList<>();

        //获得查询到的顾客信息
        List<Customer> customerList = customerService.findCusAllInfoBySelective(id,userName,tel,bid);

        //判断查询到的顾客信息
        if (null != customerList){
            for(Customer customer : customerList){
                //创建All对象
                AllInfo allInfo = new AllInfo();
                allInfo.setId(customer.getId());
                allInfo.setBkid(customer.getBkid());
                allInfo.setBid(customer.getBid());
                allInfo.setName(customer.getName());
                allInfo.setTel(customer.getTel());
                allInfo.setAddr(customer.getAddr());

                //根据查询到的顾客信息拿到业务类型
                //业务类型
                Kind kind = kindService.findByBKID(customer.getBkid());
                allInfo.setBkName(kind.getBkName());
                allInfo.setComment(kind.getComment());

                //设置性别
                switch (customer.getSex()){
                    case "0":allInfo.setSex("女");break;
                    default:allInfo.setSex("男");
                }

                //业务具体信息
                Business business = businessService.findBusinessByBId(customer.getBid());
                allInfo.setbName(business.getbName());
                allInfo.setBusAddr(business.getComment());

                //添加进入列表
                allInfos.add(allInfo);
            }
        }

        //添加属性
        mv.addObject("allInfoList",allInfos);
        mv.setViewName("user/list");

        return mv;
    }

    /**
     * 获得所有顾客信息
     * @return 返回List<Customer> json数据格式
     */
    @GetMapping("/getCusInfoAll.do")
    @ResponseBody
    public ModelAndView getCusInfoAll(){
        //创建ModelAndView对象
        ModelAndView mv = new ModelAndView();

        //创建All对象集合
        List<AllInfo> allInfos = new ArrayList<>();

        //获得查询到的顾客信息
        List<Customer> customerList = customerService.findCusAll();

        //遍历集合
        for(Customer customer : customerList){
            //创建AllInfo对象
            AllInfo allInfo = new AllInfo();

            //获得业务类型id
            String bkId = customer.getBkid();

            //获得业务机构id
            String bId = customer.getBid();

            //根据bkid 获得业务类型的响应数据
            Kind kind = kindService.findByBKID(bkId);

            //根据bid 获得业务机构的响应数据
            Business business = businessService.findBusinessByBId(bId);

            //设置数据
            allInfo.setId(customer.getId());
            allInfo.setBkName(kind.getBkName());
            allInfo.setComment(kind.getComment());
            allInfo.setBid(bId);
            allInfo.setbName(business.getbName());
            allInfo.setBusAddr(business.getComment());
            allInfo.setId(customer.getId());
            allInfo.setName(customer.getName());
            allInfo.setSex(customer.getSex());
            allInfo.setTel(customer.getTel());
            allInfo.setAddr(customer.getAddr());

            allInfos.add(allInfo);

            //添加属性
            mv.addObject("allInfoList",allInfos);
        }
        //设置转向地址
        mv.setViewName("user/list");
        return mv;
    }

    /**
     * 删除对应顾客信息
     * @param id 顾客id
     * @return 返回 顾客页面
     */
    @GetMapping("/deleteCusById.do")
    public String deleteCusById(String id){
        customerService.removeById(id);
        return  "user/list";
    }

    /**
     * 获得所有业务种类数据
     * @return 返回到业务类型页面
     */
    @GetMapping("/getKindAll.do")
    public ModelAndView getKindAll(){
        //创建ModelAndView对象
        ModelAndView mv = new ModelAndView();

        //业务类型列表
        List<Kind> kindList = kindService.findAllKind();

        //添加属性
        mv.addObject("kindList",kindList);

        //请求转发
        mv.setViewName("kind/list");
        return mv;
    }

    /**
     * 删除对应的 业务类型数据
     * @param id 业务类型id
     * @return 返回业务类型页面
     */
    @GetMapping("/deleteKindById.do")
    public String deleteKindByBKId(String id){
        kindService.deleteKindByBKId(id);

        return "kind/list";
    }

    /**
     * 选择性筛选查询条件
     * @param bkid 业务类型id
     * @param bkName 业务类型名称
     * @return 返回kind 对象 json数据
     */
    @PostMapping("/getKindBySelective.do")
    public @ResponseBody ModelAndView getKindBySelective(String bkid,String bkName){
        //创建ModelAndView对象
        ModelAndView mv = new ModelAndView();

        //查询数据
        List<Kind> kindList = kindService.findKindBySelectve(bkid,bkName);

        //添加数据
        mv.addObject("kindList",kindList);

        //添加试图
        mv.setViewName("kind/list");

        //返回
        return mv;
    }

    /**
     * 获得所有业务机构名称
     * @return 返回业务机构列表
     */
    @GetMapping("/getBusinessAll.do")
    public ModelAndView getBusinessAll(){
        //创建ModelAndView
        ModelAndView mv = new ModelAndView();

        //获得所有业务机构数据
        List<Business> businessList = businessService.findBusinessByAll();
        //添加属性

        mv.addObject("businessList",businessList);

        mv.setViewName("business/list");

        return mv;
    }

    /**
     * 获得对应业务机构数据
     * @param bid 业务id
     * @param bName 业务名
     * @return 返回列表
     */
    @PostMapping("/getBusiness.do")
    public ModelAndView getBusiness(String bid,String bName){
        //创建ModelAndView对象
        ModelAndView mv = new ModelAndView();

        //获得集合
        List<Business> businessList = businessService.findBusinessBySelective(bid,bName);

        //添加属性
        mv.addObject("businessList",businessList);

        //请求转发
        mv.setViewName("business/list");

        return mv;
    }
}
