package com.cqcet.phone.website.web;

import com.cqcet.phone.website.pojo.Business;
import com.cqcet.phone.website.pojo.Customer;
import com.cqcet.phone.website.pojo.Kind;
import com.cqcet.phone.website.service.BusinessService;
import com.cqcet.phone.website.service.CustomerService;
import com.cqcet.phone.website.service.KindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/font")
public class FontController {
    @Autowired
    private KindService kindService;
    @Autowired
    private BusinessService businessService;
    @Autowired
    private CustomerService customerService;

    /**
     * 获得所有业务种类
     * @return 返回业务种类json对象
     */
    @GetMapping("/getKind.do")
    @ResponseBody
    public List<Kind> getKind(){
        return kindService.findAllKind();
    }

    /**
     * 获得相应业务种类id的业务名称
     * @param BKId 业务种类id
     * @return 返回业务名称json对象
     */
    @GetMapping("/getBusiness.do")
    public @ResponseBody List<Business> getBusinessByBKId(String BKId){
        return businessService.findBusinessByBKId(BKId);
    }

    /**
     * 获得所有的业务机构数据
     * @return 返回List<Business> json数据
     */
    @GetMapping("/getBusinessAll.do")
    public @ResponseBody List<Business> getBusinessAll(){
        return businessService.findBusinessByAll();
    }


    /**
     * 添加顾客信息
     * @param name 姓名
     * @param sex 性别
     * @param tel 电话
     * @param add 地址
     * @param BKId 业务类型id
     * @param BId 具体业务名称代码
     * @return 返回界面
     */
    @PostMapping(value = "/getFormInfo.do")
    public String getFormInfo(String name, String sex, String tel, String add, String BKId, String BId){
        Customer customer = new Customer();
        customer.setName(name);
        customer.setSex(sex);
        customer.setTel(tel);
        customer.setAddr(add);
        customer.setBkid(BKId);
        customer.setBid(BId);
        customerService.insertByCus(customer);
        return "index";
    }
}