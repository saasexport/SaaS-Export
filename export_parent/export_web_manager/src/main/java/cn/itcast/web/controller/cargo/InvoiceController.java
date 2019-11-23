package cn.itcast.web.controller.cargo;

import cn.itcast.common.utils.BeanMapUtils;
import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.dubbo.config.annotation.Reference;
import com.github.pagehelper.PageInfo;
import cn.itcast.domain.cargo.Invoice;
import cn.itcast.domain.cargo.InvoiceExample;
import cn.itcast.domain.cargo.ShippingOrderExample;
import cn.itcast.service.cargo.InvoiceService;
import cn.itcast.service.cargo.ShippingOrderService;
import cn.itcast.web.controller.BaseController;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping(value = "/cargo/invoice")
public class InvoiceController extends BaseController {

    @Reference
    private InvoiceService invoiceService;

    @Reference
    private ShippingOrderService shippingOrderService;

    @RequestMapping(value = "/list", name = "查询所有发票信息并分页")
    public String list(@RequestParam(defaultValue = "1") int page,
                       @RequestParam(defaultValue = "5") int size) {

        InvoiceExample invoiceExample = new InvoiceExample();

        PageInfo pageInfo = invoiceService.findAll(invoiceExample, page, size);

        request.setAttribute("page", pageInfo);

        return "cargo/invoice/invoice-list";

    }

    @RequestMapping(value = "/toAdd")
    public String toAdd(@RequestParam(defaultValue = "1") int page,
                        @RequestParam(defaultValue = "5") int size) {

        ShippingOrderExample shippingOrderExample = new ShippingOrderExample();
        ShippingOrderExample.Criteria shippingCriteria = shippingOrderExample.createCriteria();
        shippingCriteria.andStateEqualTo(1);

        PageInfo pageInfo = shippingOrderService.findAll(shippingOrderExample, page, size);
        request.setAttribute("page", pageInfo);

        return "cargo/invoice/invoice-add";

    }

    @RequestMapping(value = "/edit")
    public String edit(Invoice invoice, String id) {
        if (StringUtils.isEmpty(invoice.getInvoiceId())) {

            //保存
            invoice.setInvoiceId(id);

            invoiceService.save(invoice);

        }

        return "redirect:/cargo/invoice/list.do";

    }

    @RequestMapping(value = "/toUpdate")
    public String toUpdate(String invoiceId) {

        Invoice invoice = invoiceService.findById(invoiceId);

        request.setAttribute("invoice", invoice);

        return "cargo/invoice/invoice-update";

    }

    @RequestMapping(value = "/update")
    public String update(Invoice invoice){

        invoiceService.update(invoice);

        return "redirect:/cargo/invoice/list.do";

    }

    @RequestMapping("/toView")
    public String toView(String invoiceId){

        Invoice invoice = invoiceService.findById(invoiceId);

        request.setAttribute("invoice",invoice);

        return "cargo/invoice/invoice-view";

    }

    @RequestMapping("/delete")
    public String delete(String invoiceId) {

        invoiceService.delete(invoiceId);

        return "redirect:/cargo/finance/list.do";

    }

    @RequestMapping("/submit")
    public String submit(String invoiceId) {

        Invoice invoice = new Invoice();
        invoice.setInvoiceId(invoiceId);
        invoice.setState(1);

        invoiceService.update(invoice);

        return "redirect:/cargo/invoice/list.do";

    }

    @RequestMapping("/cancel")
    public String cancel(String invoiceId) {

        Invoice invoice = new Invoice();
        invoice.setInvoiceId(invoiceId);
        invoice.setState(0);

        invoiceService.update(invoice);

        return "redirect:/cargo/invoice/list.do";

    }

    @RequestMapping("/toImport")
    public void toImport(String invoiceId) throws Exception{

        Invoice invoice = invoiceService.findById(invoiceId);

        String path = session.getServletContext().getRealPath("/")+"/jasper/invoice.jasper";

        Map<String, Object> map = BeanMapUtils.beanToMap(invoice);

        JasperPrint jasperPrint = JasperFillManager.fillReport(path, map, new JREmptyDataSource());

        JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());

    }

}
