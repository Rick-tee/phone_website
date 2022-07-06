package com.cqcet.phone.website.web;

import com.cqcet.phone.website.pojo.Kind;
import com.cqcet.phone.website.service.KindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/kind")
public class KindController {
    @Autowired
    private KindService kindService;

    /**
     * 获得对应业务类型数据
     * @param bkid 业务类型id
     * @return 返回视图
     */
    @RequestMapping("/getKindByBKId.do")
    public ModelAndView getKindById(String bkid){
        //创建ModelAndView对象
        ModelAndView mv = new ModelAndView();

        //获得Kind list
        Kind kind = kindService.findByBKID(bkid);

        mv.addObject("kind",kind);

        mv.setViewName("kind/edit");

        return mv;
    }


    /**
     * 向业务类型表中添加数据
     * @param bkid 业务类型编号
     * @param bkName 业务类型名称
     * @param comment 业务类型描述
     * @return 返回视图
     */
    @PostMapping("/addKind.do")
    public ModelAndView addKind(String bkid,String bkName,String comment){
        //创建ModelAndView对象
        ModelAndView mv = new ModelAndView();

        //创建Kind
        Kind kind = new Kind();
        kind.setBkid(bkid);
        kind.setBkName(bkName);
        kind.setComment(comment);

        //添加数据
        int result = 0;

        try{
            result = kindService.addKind(kind);
        }catch (Exception e){
            e.printStackTrace();
        }

        //判断数据是否成功添加
        if (result != 0){
            mv.addObject("msg","数据添加成功");
        }else {
            mv.addObject("msg","该业务类型代码已存在！");
        }

        //添加视图
        mv.setViewName("kind/add");
        return mv;
    }
}
