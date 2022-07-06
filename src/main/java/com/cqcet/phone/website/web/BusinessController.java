package com.cqcet.phone.website.web;

import com.cqcet.phone.website.pojo.Business;
import com.cqcet.phone.website.pojo.Kind;
import com.cqcet.phone.website.service.BusinessService;
import com.cqcet.phone.website.service.KindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/business")
public class BusinessController {
    @Autowired
    private BusinessService businessService;
    @Autowired
    private KindService kindService;

    /**
     * 获得业务机构名称
     * @param bid 业务机构名称编号
     * @return 返回视图
     */
    @RequestMapping("getBusinessByBId.do")
    public ModelAndView getBusinessByBId(String bid){
        //创建ModelAndView
        ModelAndView mv = new ModelAndView();

        //查询业务机构具体名称
        Business business = businessService.findBusinessByBId(bid);

        if (business != null){
            Kind kind = kindService.findByBKID(business.getBkid());

            business.setBkid(kind.getBkName());
        }

        //添加属性
        mv.addObject("business",business);

        //添加视图
        mv.setViewName("business/edit");

        return mv;
    }

    /**
     * 向业务机构表中添加数据
     * @param bid 业务机构id
     * @param bName 业务机构名称
     * @param bkid 业务机构类型代码
     * @param comment 描述信息
     * @return 返回 business add 视图
     */
    @PostMapping("/addBusinessBySelect.do")
    public ModelAndView addBusinessBySelect(String bid,String bName,String bkid,String comment){
        //创建ModelAndView对象
        ModelAndView mv = new ModelAndView();

        //创建Business对象
        Business business = new Business();

        //添加数据
        business.setBkid(bkid);
        business.setBid(bid);
        business.setbName(bName);
        business.setComment(comment);

        //影响记录数
        int result = 0;

        try{
            //数据添加进入数据库
            result = businessService.addBusinessBySelect(business);
        }catch(Exception e){
            e.printStackTrace();
        }

        //判断数据是否成功添加
        if (result != 0){
            mv.addObject("msg","数据添加成功！");
        }else {
            mv.addObject("msg","该业务机构编号已存在！");
        }

        //请求转发视图
        mv.setViewName("business/add");

        return mv;
    }
}
