package cn.itcast.web.controller.cargo;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.dubbo.config.annotation.Reference;
import com.github.pagehelper.PageInfo;
import cn.itcast.domain.cargo.Finance;
import cn.itcast.domain.cargo.FinanceExample;
import cn.itcast.domain.cargo.Invoice;
import cn.itcast.service.cargo.FinanceService;
import cn.itcast.service.cargo.InvoiceService;
import cn.itcast.web.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping(value = "/cargo/finance")
public class FinanceController extends BaseController {

    @Reference
    private FinanceService financeService;

    @Reference
    private InvoiceService invoiceService;

    @RequestMapping(value = "/list")
    public String list(@RequestParam(defaultValue = "1") int page,
                       @RequestParam(defaultValue = "5") int size) {

        FinanceExample financeExample = new FinanceExample();

        PageInfo pageInfo = financeService.findAll(financeExample, page, size);

        request.setAttribute("page", pageInfo);

        return "cargo/finance/finance-list";

    }

    @RequestMapping(value = "/toAdd")
    public String toAdd(){

        List<Invoice> invoices = invoiceService.findByState(1);

        request.setAttribute("invoices", invoices);

        return "cargo/finance/finance-add";

    }

    @RequestMapping("/edit")
    public String edit(Finance finance, String invoiceId) {
        if (StringUtils.isEmpty(finance.getFinanceId())) {

            finance.setFinanceId(invoiceId);
            financeService.save(finance);

            Invoice invoice = new Invoice();
            invoice.setInvoiceId(invoiceId);
            invoice.setState(2);
            invoiceService.update(invoice);

        } else {

            financeService.update(finance);

        }

        return "redirect:/cargo/finance/list.do";

    }


    @RequestMapping("/toUpdate")
    public String toUpdate(String financeId) {

        Finance export = financeService.findById(financeId);

        request.setAttribute("finance", export);

        return "cargo/finance/finance-update";

    }

    @RequestMapping("/delete")
    public String delete(String financeId) {

        financeService.delete(financeId);

        Invoice invoice = new Invoice();
        invoice.setInvoiceId(financeId);
        invoice.setState(1);
        invoiceService.update(invoice);

        return "redirect:/cargo/finance/list.do";

    }

    @RequestMapping("/submit")
    public String submit(String financeId) {

        Finance finance = new Finance();
        finance.setFinanceId(financeId);
        finance.setState(1);
        financeService.update(finance);

        return "redirect:/cargo/finance/list.do";

    }

    @RequestMapping("/cancel")
    public String cancel(String financeId) {

        Finance finance = new Finance();
        finance.setFinanceId(financeId);
        finance.setState(0);
        financeService.update(finance);

        return "redirect:/cargo/finance/list.do";

    }

}
