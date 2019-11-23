package cn.itcast.web.controller.cargo;

import cn.itcast.common.utils.MailUtil;
import cn.itcast.common.utils.MailUtils;
import cn.itcast.domain.cargo.PackingList;
import cn.itcast.domain.cargo.PackingListExample;
import cn.itcast.domain.cargo.ShippingOrder;
import cn.itcast.domain.cargo.ShippingOrderExample;
import cn.itcast.service.cargo.ExportProductService;
import cn.itcast.service.cargo.PackingListService;
import cn.itcast.service.cargo.ShippingOrderService;
import cn.itcast.web.controller.BaseController;
import com.alibaba.dubbo.config.annotation.Reference;
import com.github.pagehelper.PageInfo;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/cargo/shipping")
public class ShippingOrderController extends BaseController {

    @Reference
    private ShippingOrderService shippingOrderService;
    @Reference
     private PackingListService packingListService;
    @Reference
    private ExportProductService exportProductService;

    /**
     * 进入合同管理的页面
     * 合同管理是把购销合同模块里state=1的查询出来再分页显示的
     * 应该是点击了已上报就跳转到此页面,应该是装箱单那边写
     @RequestMapping("/contractList") public String contractList(@RequestParam(defaultValue = "1") int page,
     @RequestParam(defaultValue = "5") int size){

     //购销合同模块里state=1的查询出来
     ContractExample example=new ContractExample();
     ContractExample.Criteria criteria = example.createCriteria();
     criteria.andCompanyIdEqualTo(getLoginCompanyId());
     criteria.andStateEqualTo(1);
     PageInfo info = contractService.findAll(example, page, size);
     request.setAttribute("page",info);
     return "cargo/export/export-contractList";
     }*/
    /**
     * 点击"委托管理" 的菜单进入报运单列表list
     * 查询所有的委托单并分页
     */
    @RequestMapping("/list")
    public String list(@RequestParam(defaultValue = "1") int page,
                       @RequestParam(defaultValue = "5") int size) {
        ShippingOrderExample shippingOrderExample = new ShippingOrderExample();
        ShippingOrderExample.Criteria shipcriteria = shippingOrderExample.createCriteria();
        shipcriteria.andCompanyIdEqualTo(companyId);
        PageInfo all = shippingOrderService.findAll(shippingOrderExample, page, size);
        request.setAttribute("page", all);
        return "cargo/shippingorder/shipping-list";
    }

    /**
     * 在合同管选中购销合同,点击报运,进入新增报运单界面
     * 参数: 多个同名参数(购销合同id)
     * 在springmvc中:数组形式接受多个同名id,String id[]
     * 在web规范中,使用字符串接受(中间用逗号隔开多个id)
     */
    /*@RequestMapping("/toExport")
    public String toExport(String shippingOrderId){
        request.setAttribute("shippingOrderId",shippingOrderId);
        return "cargo/shippingorder/shipping-toExport";
    }
*/
    //点击保存委托单
    @RequestMapping("/toAdd")
    public String toAdd(@RequestParam(defaultValue = "1") int page,
                        @RequestParam(defaultValue = "5") int size) {
        //2.显示所有不是草稿状态的装箱单和状态
       PackingListExample packingListExample = new PackingListExample();
        PackingListExample.Criteria criteria = packingListExample.createCriteria();
        criteria.andCompanyIdEqualTo(companyId);
        criteria.andStateEqualTo(1);
        PageInfo all = packingListService.findAll(page, size, packingListExample);
        request.setAttribute("page", all);
        return "cargo/shippingorder/shipping-add";
    }

    /**
     * 点击保存按钮,进行保存委托单操作:
     */
    @RequestMapping("/edit")
    public String edit(ShippingOrder shippingOrder, String PackingListId) {

        shippingOrder.setCompanyId(companyId);
        shippingOrder.setCompanyName(companyName);
        if (StringUtils.isEmpty(shippingOrder.getShippingOrderId())) {
            shippingOrder.setCheckBy(loginUser.getUserName());
            shippingOrder.setCreateBy(loginUser.getId());
            shippingOrder.setCreateDept(loginUser.getDeptId());
            shippingOrder.setShippingOrderId(PackingListId);
            //为空,就是正在进行保存
            shippingOrderService.save(shippingOrder);
            //发送邮件start
            if(shippingOrder.getOrderType()=="SEA"||shippingOrder.getOrderType()=="AIR"){
                shippingOrder.setOrderType("船运");
            }else {
                shippingOrder.setOrderType("空运");
            }
            try {
                MailUtils.sendMsg("1721536603@qq.com", "*****您的委托单已生成*****\n",
                        "\n*****委托单id:*****"+shippingOrder.getShippingOrderId()+"\n*****运输方式*****\n"+shippingOrder.getOrderType()
                                +"\n*****货主*****\n"+shippingOrder.getShipper()+"\n*****卸货港*****\n"+shippingOrder.getPortOfDischarge()
                                );
            } catch (Exception e) {
                e.printStackTrace();
            }
            //发送邮件end
            PackingList packingList = new PackingList();
            packingList.setPackingListId(PackingListId);
            packingList.setState(3);
            packingListService.update(packingList);
        } else {
            shippingOrder.setUpdateBy(loginUser.getUserName());
            shippingOrderService.update(shippingOrder);
        }
        return "redirect:/cargo/shipping/list.do";
    }

    /**
     * 进入委托单修改页面
     */
    @RequestMapping("/toUpdate")
    public String toUpdate(String shippingOrderId) {
        //1.根据id查询委托单shippingOrder信息
        ShippingOrder shippingOrder = shippingOrderService.findById(shippingOrderId);
        request.setAttribute("shippingOrder", shippingOrder);
        //2.显示依赖的本条装箱单和状态
        PackingList packingList = packingListService.findById(shippingOrderId);
        request.setAttribute("page", packingList);
        return "cargo/shippingorder/shipping-update";
    }

    /**
     * 进入委托单修改页面
     */
    @RequestMapping("/toView")
    public String toView(String shippingOrderId) {
        //1.根据id查询委托单shippingOrder信息
        ShippingOrder shippingOrder = shippingOrderService.findById(shippingOrderId);
        request.setAttribute("shippingOrder", shippingOrder);
        //2.显示依赖的本条装箱单和状态
        PackingList packingList = packingListService.findById(shippingOrderId);
        request.setAttribute("page", packingList);
        return "cargo/shippingorder/shipping-view";
    }

    /**
     * 提交方法:
     * 参数:报运单的id
     * 将报运单状态由0改成1
     */
    @RequestMapping("/submit")
    public String submit(String shippingOrderId) {
        ShippingOrder shippingOrder = new ShippingOrder();
        shippingOrder.setShippingOrderId(shippingOrderId);
        shippingOrder.setState(1);
        shippingOrderService.update(shippingOrder);
        return "redirect:/cargo/shipping/list.do";
    }

    /**
     * 取消方法:
     * 参数:报运单的id
     * 将报运单状态由1改成0
     */
    @RequestMapping("/cancel")
    public String cancel(String shippingOrderId) {
        ShippingOrder shippingOrder = new ShippingOrder();
        shippingOrder.setShippingOrderId(shippingOrderId);
        shippingOrder.setState(0);
        shippingOrderService.update(shippingOrder);
        return "redirect:/cargo/shipping/list.do";
    }
    @RequestMapping("/delete")
    public String delete(String shippingOrderId) {
        shippingOrderService.delete(shippingOrderId);
        return "redirect:/cargo/shipping/list.do";
    }
}
