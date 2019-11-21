package cn.itcast.web.controller.cargo;

import cn.itcast.common.utils.DownloadUtil;
import cn.itcast.dao.cargo.ContractDao;
import cn.itcast.domain.cargo.Contract;
import cn.itcast.domain.cargo.ContractExample;
import cn.itcast.domain.vo.ContractProductVo;
import cn.itcast.service.cargo.ContractProductService;
import cn.itcast.service.cargo.ContractService;
import cn.itcast.web.controller.BaseController;
import com.alibaba.dubbo.config.annotation.Reference;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.junit.runner.RunWith;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
@RequestMapping(value = "/cargo/contract")
public class ContractController extends BaseController {

    @Reference
    private ContractService contractService;

    @Reference
    private ContractProductService contractProductService;

    @RequestMapping(value = "/list", name = "合同列表查询")
    public String list(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size){
        ContractExample example = new ContractExample();
        //合同企业进行签定的
        ContractExample.Criteria criteria = example.createCriteria();
        criteria.andCompanyIdEqualTo(companyId);

        if (loginUser.getDegree()==3){
            //如果你是主管，增加创建部门条件
            criteria.andCreateDeptEqualTo(loginUser.getDeptId());
        }else if (loginUser.getDegree()==4) {
            //如果你是小兵，增加创建人条件
            criteria.andCreateByEqualTo(loginUser.getId());
        }else if (loginUser.getDegree()==2){
            //管理部门以及下属的人员
            criteria.andCreateDeptLike(loginUser.getDeptId()+"%");
        }


        PageInfo pageInfo = contractService.findAll(example, page, size);
        request.setAttribute("page", pageInfo);
        return "cargo/contract/contract-list";
    }


    @RequestMapping(value = "/toAdd")
    public String toAdd(){
        return "cargo/contract/contract-add";
    }


    @RequestMapping(value = "/edit")
    public String edit(Contract contract){
        contract.setCompanyId(companyId);
        contract.setCompanyName(companyName);

        if (StringUtil.isEmpty(contract.getId())){

            //新增的时候写入创建人与创建部门
            contract.setCreateBy(loginUser.getId());
            contract.setCreateDept(loginUser.getDeptId());

            contractService.save(contract);
        }else {
            contractService.update(contract);
        }

        return "redirect:/cargo/contract/list.do";
    }


    @RequestMapping(value = "/toUpdate")
    public String toUpdate(String id){
        Contract contract = contractService.findById(id);
        request.setAttribute("contract", contract);
        return "cargo/contract/contract-update";
    }

    @RequestMapping(value = "/delete")
    public String delete(String id){
        contractService.delete(id);
        return "redirect:/cargo/contract/list.do";
    }


    @RequestMapping(value = "/submit")
    public String submit(String id){
        Contract contract = contractService.findById(id);
        contract.setState(1);
        contractService.update(contract);
        return "redirect:/cargo/contract/list.do";
    }

    @RequestMapping(value = "/cancel")
    public String cancel(String id){
        Contract contract = contractService.findById(id);
        contract.setState(0);
        contractService.update(contract);
        return "redirect:/cargo/contract/list.do";
    }


    @RequestMapping(value = "/print")
    public String print(){
        return "cargo/print/contract-print";
    }

    @RequestMapping(value = "/printExcelByTemplate")
    public void printExcelByTemplate(String inputDate) throws IOException {
        //1、通过inputDate取出数据
        List<ContractProductVo> vos = contractProductService.findByShipTime(inputDate);

        String path = session.getServletContext().getRealPath("/")+"/make/xlsprint/tOUTPRODUCT.xlsx";

        //打开模板的excel表
        Workbook wb = new XSSFWorkbook(path);
        Sheet sheet = wb.getSheetAt(0);

        //大标题
        Row row = sheet.getRow(0);
        Cell cell = row.getCell(1);
        cell.setCellValue(inputDate.replaceAll("-", "年")+"月份出货表");

        //小标题

        //内容
        row = sheet.getRow(2);
        CellStyle css[] = new CellStyle[9];
        for (int i=1; i<9; i++){
            cell = row.getCell(i);
            css[i] = cell.getCellStyle();
        }

        int index = 2;
        for (ContractProductVo vo : vos) {

            //创建行
            //vo取数据
            row = sheet.createRow(index);

            //vo逐个进行给单元格赋值
            cell = row.createCell(1);
            cell.setCellValue(vo.getCustomName());
            cell.setCellStyle(css[1]);

            cell = row.createCell(2);
            cell.setCellValue(vo.getContractNo());
            cell.setCellStyle(css[2]);

            cell = row.createCell(3);
            cell.setCellValue(vo.getProductNo());
            cell.setCellStyle(css[3]);

            cell = row.createCell(4);
            cell.setCellValue(vo.getCnumber());
            cell.setCellStyle(css[4]);

            cell = row.createCell(5);
            cell.setCellValue(vo.getFactoryName());
            cell.setCellStyle(css[5]);

            cell = row.createCell(6);
            cell.setCellValue(new SimpleDateFormat("yyyy-MM-dd").format(vo.getDeliveryPeriod()));
            cell.setCellStyle(css[6]);

            cell = row.createCell(7);
            cell.setCellValue(new SimpleDateFormat("yyyy-MM-dd").format(vo.getShipTime()));
            cell.setCellStyle(css[7]);

            cell = row.createCell(8);
            cell.setCellValue(vo.getTradeTerms());
            cell.setCellStyle(css[8]);


            index++;
        }

        //下载EXCEL表
        //ByteArrayOutputStream byteArrayOutputStream, HttpServletResponse response, String returnName
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        wb.write(outputStream);
        new DownloadUtil().download(outputStream, response, "出货表.xlsx");
    }

    /**
     * 下载EXCEL表
     * 需要跳转页面吗？
     */
    @RequestMapping(value = "/printExcel")
    public void printExcel(String inputDate) throws IOException {
        //1、通过inputDate取出数据
        List<ContractProductVo> vos = contractProductService.findByShipTime(inputDate);

        //2、创建EXCEL工作薄
        Workbook wb = new SXSSFWorkbook();
        Sheet sheet = wb.createSheet();


        sheet.setColumnWidth(1, 26*256);
        sheet.setColumnWidth(2, 12*256);
        sheet.setColumnWidth(3, 30*256);
        sheet.setColumnWidth(4, 12*256);
        sheet.setColumnWidth(5, 15*256);
        sheet.setColumnWidth(6, 10*256);
        sheet.setColumnWidth(7, 10*256);
        sheet.setColumnWidth(8, 10*256);


        CellRangeAddress cellAddresses = new CellRangeAddress(0,0,1,8);
        sheet.addMergedRegion(cellAddresses);

        //大标题
        Row row = sheet.createRow(0);
        row.setHeightInPoints(36);
        Cell cell = row.createCell(1);

        /*CellStyle cellStyle = wb.createCellStyle();
        Font font = wb.createFont();
        font.setBold(true);
        font.setFontHeightInPoints((short) 16);
        font.setFontName("宋体");
        cellStyle.setFont(font);*/
        cell.setCellStyle(bigTitle(wb));
        cell.setCellValue(inputDate.replaceAll("-", "年")+"月份出货表");  //2015年01月份出货表

        //小标题
        row = sheet.createRow(1);
        row.setHeightInPoints(26);
        /*cell = row.createCell(1);
        cell.setCellValue("客户");*/

        String[] strings = new String[]{"", "客户", "订单号", "货号", "数量", "工厂", "工厂交期", "船期", "贸易条款"};
        for (int i=1; i<strings.length; i++){
            cell = row.createCell(i);
            cell.setCellValue(strings[i]);

            /*font = wb.createFont();
            font.setBold(true);
            font.setFontHeightInPoints((short) 12);
            font.setFontName("黑体");
            cellStyle.setFont(font);
            cell.setCellStyle(cellStyle);*/
            cell.setCellStyle(title(wb));

        }

        //从第2行开始循环
        int index = 2;
        for (ContractProductVo vo : vos) {
//            for(int i=0; i<5000; i++) {
                //vo: vos

                //创建行
                //vo取数据
                row = sheet.createRow(index);

                //vo逐个进行给单元格赋值
                cell = row.createCell(1);
                cell.setCellValue(vo.getCustomName());
                //cell.setCellStyle(text(wb));

                cell = row.createCell(2);
                cell.setCellValue(vo.getContractNo());
                //cell.setCellStyle(text(wb));

                cell = row.createCell(3);
                cell.setCellValue(vo.getProductNo());
                //cell.setCellStyle(text(wb));

                cell = row.createCell(4);
                cell.setCellValue(vo.getCnumber());
                //cell.setCellStyle(text(wb));

                cell = row.createCell(5);
                cell.setCellValue(vo.getFactoryName());
                //cell.setCellStyle(text(wb));

                cell = row.createCell(6);
                cell.setCellValue(new SimpleDateFormat("yyyy-MM-dd").format(vo.getDeliveryPeriod()));
                //cell.setCellStyle(text(wb));

                cell = row.createCell(7);
                cell.setCellValue(new SimpleDateFormat("yyyy-MM-dd").format(vo.getShipTime()));
                //cell.setCellStyle(text(wb));

                cell = row.createCell(8);
                cell.setCellValue(vo.getTradeTerms());
                //cell.setCellStyle(text(wb));

                index++;
//            }
        }

        //下载EXCEL表
        //ByteArrayOutputStream byteArrayOutputStream, HttpServletResponse response, String returnName
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        wb.write(outputStream);
        new DownloadUtil().download(outputStream, response, "出货表.xlsx");
    }


    //大标题的样式
    public CellStyle bigTitle(Workbook wb){
        CellStyle style = wb.createCellStyle();
        Font font = wb.createFont();
        font.setFontName("宋体");
        font.setFontHeightInPoints((short)16);
        font.setBold(true);//字体加粗
        style.setFont(font);
        style.setAlignment(HorizontalAlignment.CENTER);				//横向居中
        style.setVerticalAlignment(VerticalAlignment.CENTER);		//纵向居中
        style.setBorderTop(BorderStyle.THIN);						//上细线
        style.setBorderBottom(BorderStyle.THIN);					//下细线
        style.setBorderLeft(BorderStyle.THIN);						//左细线
        style.setBorderRight(BorderStyle.THIN);						//右细线
        return style;
    }

    //小标题的样式
    public CellStyle title(Workbook wb){
        CellStyle style = wb.createCellStyle();
        Font font = wb.createFont();
        font.setFontName("黑体");
        font.setFontHeightInPoints((short)12);
        style.setFont(font);
        style.setAlignment(HorizontalAlignment.CENTER);				//横向居中
        style.setVerticalAlignment(VerticalAlignment.CENTER);		//纵向居中
        style.setBorderTop(BorderStyle.THIN);						//上细线
        style.setBorderBottom(BorderStyle.THIN);					//下细线
        style.setBorderLeft(BorderStyle.THIN);						//左细线
        style.setBorderRight(BorderStyle.THIN);						//右细线
        return style;
    }

    //文字样式
    public CellStyle text(Workbook wb){
        CellStyle style = wb.createCellStyle();
        Font font = wb.createFont();
        font.setFontName("Times New Roman");
        font.setFontHeightInPoints((short)10);

        style.setFont(font);

        style.setAlignment(HorizontalAlignment.LEFT);				//横向居左
        style.setVerticalAlignment(VerticalAlignment.CENTER);		//纵向居中
        style.setBorderTop(BorderStyle.THIN);						//上细线
        style.setBorderBottom(BorderStyle.THIN);					//下细线
        style.setBorderLeft(BorderStyle.THIN);						//左细线
        style.setBorderRight(BorderStyle.THIN);						//右细线

        return style;
    }
}
