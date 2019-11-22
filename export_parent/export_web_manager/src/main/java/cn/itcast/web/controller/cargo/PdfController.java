package cn.itcast.web.controller.cargo;

import cn.itcast.common.utils.BeanMapUtils;
import cn.itcast.dao.cargo.ExportDao;
import cn.itcast.domain.cargo.Export;
import cn.itcast.domain.cargo.ExportProduct;
import cn.itcast.domain.cargo.ExportProductExample;
import cn.itcast.domain.cargo.ShippingOrder;
import cn.itcast.domain.system.User;
import cn.itcast.service.cargo.ExportProductService;
import cn.itcast.service.cargo.ExportService;
import cn.itcast.service.cargo.ShippingOrderService;
import cn.itcast.web.controller.BaseController;
import com.alibaba.dubbo.config.annotation.Reference;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;

@Controller
@RequestMapping(value = "/cargo/export")
public class PdfController extends BaseController{


    @Reference
    private ExportService exportService;
    @Reference
    private ShippingOrderService shippingOrderService;
    @Reference
    private ExportProductService exportProductService;

    @RequestMapping(value = "/exportPdf")
    public void exportPdf() throws Exception {

        List list = new ArrayList();
        for (int i = 1; i<6; i++){
            User user = new User();
            user.setUserName("林"+i);
            user.setId(String.valueOf(i));
            user.setDeptName("开发部");
            user.setEmail("mail.16"+i+".com");
            list.add(user);
        }

        for (int i = 1; i<4; i++){
            User user = new User();
            user.setUserName("李"+i);
            user.setId(String.valueOf(i));
            user.setDeptName("测试部");
            user.setEmail("mail.16"+i+".com");
            list.add(user);
        }

        String path = session.getServletContext().getRealPath("/")+"/jasper/test007.jasper";
        JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(list);
        JasperPrint jasperPrint = JasperFillManager.fillReport(path, new HashMap<String, Object>(), dataSource);
        JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
    }

    @RequestMapping(value = "/exportPdf006")
    public void exportPdf006(String id) throws Exception {
        //1、通过id查询export主表内容，报运单信息，返回实体类
        Export export = exportService.findById(id);

        export.setCustomerContract("123123123");

        //1.1、将实体类转化为map
        Map<String, Object> exportMap = BeanMapUtils.beanToMap(export);

        //2、通过id查询exportProduct报运单商品信息，返回list
        ExportProductExample exportProductExample = new ExportProductExample();
        ExportProductExample.Criteria criteria = exportProductExample.createCriteria();
        criteria.andExportIdEqualTo(id);
        List<ExportProduct> list = exportProductService.findAll(exportProductExample);

        // [{productNo: 123, packingUnit: 1}, {productNo: 1234, packingUnit: 12}]

        JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(list);

        String path = session.getServletContext().getRealPath("/")+"/jasper/export.jasper";
        JasperPrint jasperPrint = JasperFillManager.fillReport(path, exportMap, dataSource);
        JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
    }

    @RequestMapping(value = "/exportPdf005")
    public void exportPdf005() throws Exception {
        String path = session.getServletContext().getRealPath("/")+"/jasper/test005.jasper";

        List list = new ArrayList();

        for (int i = 0; i < 5; i++) {
            Map map = new HashMap();
            map.put("username", "菜10"+i);
            map.put("value", new Random().nextInt(1000));
            list.add(map);
        }

        JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(list);

        //new JREmptyDataSource() --> list
        JasperPrint jasperPrint = JasperFillManager.fillReport(path, new HashMap<String, Object>(), dataSource);
        JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
    }


    @RequestMapping(value = "/exportPdf004")
    public void exportPdf004() throws Exception {
        String path = session.getServletContext().getRealPath("/")+"/jasper/test004.jasper";

        Map map = new HashMap();

        map.put("username", "菜10");
        map.put("deptname", "开发部");
        map.put("age", 12);
        map.put("salary", 2000.0d);

        List list = new ArrayList();

        for (int i = 0; i < 5; i++) {
            list.add(map);
        }

        JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(list);

        //new JREmptyDataSource() --> list
        JasperPrint jasperPrint = JasperFillManager.fillReport(path, new HashMap<String, Object>(), dataSource);
        JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
    }

    @RequestMapping(value = "/exportPdf003")
    public void exportPdf003() throws Exception {
        String path = session.getServletContext().getRealPath("/")+"/jasper/test003.jasper";

        Map map = new HashMap();

        map.put("username", "菜10");
        map.put("deptname", "开发部");
        map.put("age", 12);
        map.put("salary", 2000.0d);

        //new JREmptyDataSource() --> list
        JasperPrint jasperPrint = JasperFillManager.fillReport(path, map, new JREmptyDataSource());
        JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
    }


    @RequestMapping(value = "/exportPdf002")
    public void exportPdf002() throws Exception {
        String path = session.getServletContext().getRealPath("/")+"/jasper/test002.jasper";
        JasperPrint jasperPrint = JasperFillManager.fillReport(path, new HashMap<String, Object>(), new JREmptyDataSource());
        JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
    }


    @RequestMapping(value = "/exportPdf001")
    public void exportPdf001() throws Exception {
        //1、获取.jasper的路径
        String path = session.getServletContext().getRealPath("/")+"/jasper/test001.jasper";

        //2、通过JasperFillManager管理器读取.jasper的文件 创建jrprint
        //String sourceFileName: 文件的路径,
        //Map<String, Object> params：文件里需要通过map填充的内容
        //JRDataSource dataSource：JR数据源，列表
        JasperPrint jasperPrint = JasperFillManager.fillReport(path, new HashMap<String, Object>(), new JREmptyDataSource());

        //3、通过JasperExportManager管理器输出pdf文件
        JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
    }
	/**
     * 进行电子报运单的pdf下载
     */
    @RequestMapping("/shipingPdf")
    public void shipingPdf(String shippingOrderId) throws Exception {
        //0.先查询委托单数据;
        ShippingOrder shippingOrder = shippingOrderService.findById(shippingOrderId);

        //1.加载pdf模板;(通过session找到模板在项目中的路径);
        String path = session.getServletContext().getRealPath("/") + "/jasper/shipping.jasper";
        //2.填充数据(需要三个参数);
           /* 参数一:模板路径;
            参数二:需要填充到模板中的数据的类型;
            参数三:(jasper中的数据源):需要填充到模板中的list集合类型的数据;*/
        //使用工具类完成shippingOrder对象放入map集合
        Map<String, Object> map = BeanMapUtils.beanToMap(shippingOrder);
        //传递对象集合的dataSource,使用JRBeanCollectionDataSource
        //JRBeanCollectionDataSource datasource = new JRBeanCollectionDataSource(eplist);
        JasperPrint jp = JasperFillManager.fillReport(path, map, new JREmptyDataSource());
        //3.输出pdf文件(预览/下载)需要两个参数;
//            参数一:jasperprint对象;
//            参数二:outputStream对象;
        JasperExportManager.exportReportToPdfStream(jp, response.getOutputStream());

    }
}
