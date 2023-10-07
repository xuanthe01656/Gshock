package spring.constant;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;
import org.thymeleaf.templateresolver.ClassLoaderTemplateResolver;
import org.xhtmlrenderer.pdf.ITextRenderer;

import com.ibm.icu.impl.LocaleDisplayNamesImpl.DataTable;
import com.itextpdf.awt.geom.Point2D;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfDocument;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import jakarta.servlet.http.HttpServletRequest;
import spring.model.OrderDetail;

public class ExportPdf {
	
//	public void exportOrderDetail(HttpServletRequest request) {
//
//        //create a PDF document
//        PdfDocument doc = new PdfDocument();
//
//        //set page margins
//        doc.getPageSettings().setMargins(30f,30f,30f,30f);
//
//        //add a page
//        PdfPageBase page = doc.getPages().add();
//
//        //initialize y coordinate
//        float y = 0;
//
//        //create a brush
//        PdfBrush brush = PdfBrushes.getBlack();
//
//        //create four types of fonts
//        PdfTrueTypeFont titleFont = new PdfTrueTypeFont(new Font("Arial", Font.BOLD, 16));
//        PdfTrueTypeFont tableFont= new PdfTrueTypeFont(new Font("Arial", 0, 10));
//        PdfTrueTypeFont headerFont= new PdfTrueTypeFont(new Font("Arial", Font.BOLD, 11));
//        PdfTrueTypeFont textFont= new PdfTrueTypeFont(new Font("Arial", 0, 12));
//
//        //draw title on the center of the page
//        PdfStringFormat format = new PdfStringFormat(PdfTextAlignment.Center);
//        page.getCanvas().drawString("Order Table", titleFont, brush, page.getCanvas().getClientSize().getWidth() / 2, y, format);
//
//        //calculate y coordinate
//        y = y + (float) titleFont.measureString("Order Table", format).getHeight();
//        y = y + 5;
//
//        //create a PdfTable instance
//        PdfTable table = new PdfTable();
//
//        //set the default cell style and row style
//        table.getStyle().setCellPadding(2);
//        table.getStyle().setBorderPen(new PdfPen(brush, 0.75f));
//        table.getStyle().getDefaultStyle().setBackgroundBrush(PdfBrushes.getWhite());
//        table.getStyle().getDefaultStyle().setFont(tableFont);
//        table.getStyle().getDefaultStyle().setStringFormat(new PdfStringFormat(PdfTextAlignment.Center));
//        table.getStyle().getAlternateStyle().setBackgroundBrush(PdfBrushes.getLightGray());
//        table.getStyle().getAlternateStyle().setFont(tableFont);
//        table.getStyle().getAlternateStyle().setStringFormat(new PdfStringFormat(PdfTextAlignment.Center));
//
//        //set the header style
//        table.getStyle().setHeaderSource(PdfHeaderSource.Column_Captions);
//        table.getStyle().getHeaderStyle().setBackgroundBrush(PdfBrushes.getPurple());
//        table.getStyle().getHeaderStyle().setFont(headerFont);
//        table.getStyle().getHeaderStyle().setTextBrush(PdfBrushes.getWhite());
//        table.getStyle().getHeaderStyle().setStringFormat(new PdfStringFormat(PdfTextAlignment.Center));
//
//        //show header at every page
//        table.getStyle().setShowHeader(true);
//
//        //connect to database
//        
//        conn = connectDBLibrary.getConnectMySQL();
//		String sql = "SELECT * FROM orders";
//		DataTable dataTable = new DataTable();
//            try {
//                
//                st = conn.createStatement();
//                rs = st.executeQuery(sql);
//                JdbcAdapter jdbcAdapter = new JdbcAdapter();
//                //export data from database to datatable
//                jdbcAdapter.fillDataTable(dataTable, rs);
//                table.setDataSourceType(PdfTableDataSourceType.Table_Direct);
//                //fill the table with datatable
//                table.setDataSource(dataTable);
//
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//
//        //paginate table
//        PdfTableLayoutFormat tableLayout = new PdfTableLayoutFormat();
//        tableLayout.setLayout(PdfLayoutType.Paginate);
//
//        //draw table at the specified x, y coordinates
//        PdfLayoutResult result = table.draw(page, new Point2D.Float(0, y), tableLayout);
//
//        //calculate y coordinate
//        y = (float) result.getBounds().getHeight() + 5;
//
//        //draw text under the table
//        result.getPage().getCanvas().drawString(String.format("* %1$s Order in the list.", table.getRows().getCount()), textFont, brush, 5, y);
//
//        //save pdf file.
//        String excelFilePath = "ExportDataToPdf.pdf";
//        String applicationPath = request.getServletContext().getRealPath("");
//        String basePath = applicationPath + File.separator + "export-pdf" + File.separator; 
//        System.out.println(basePath);
//        doc.saveToFile(basePath+excelFilePath);
//    }
 public String exportPdf(HttpServletRequest request, List<OrderDetail> listOrder) throws Exception{
     
     /* Create Connection objects */
	
//	int num = 0;
//	
//	String sql1 = "SELECT COUNT(*) FROM `orders`;";
//	try {
//		st = conn.createStatement();
//		rs = st.executeQuery(sql1);
//		while(rs.next()) {
//			num = rs.getInt(1);				
//		}
//	} catch (SQLException e) {
//		e.printStackTrace();
//	}
     Document my_pdf_report = new Document();
     my_pdf_report.setPageSize(PageSize.A4.rotate());
     String pdf = "ExportDataToPdf.pdf";
     String applicationPath = request.getServletContext().getRealPath("/WEB-INF/resources/gshock/");
     String basePath = applicationPath + File.separator + "export-pdf" + File.separator; 
     System.out.println(applicationPath);
     File dir = new File(basePath);
		if(!dir.exists()) {
			dir.mkdirs();
		}
     PdfWriter.getInstance(my_pdf_report, new FileOutputStream(basePath+pdf));
     my_pdf_report.open(); 
     //we have four columns in our table
     PdfPTable my_report_table = new PdfPTable(10);
     //create a cell object
     PdfPCell table_cell;
     table_cell=new PdfPCell(new Phrase("ORDER CODE"));
     my_report_table.addCell(table_cell);
     table_cell=new PdfPCell(new Phrase("FULLNAME"));
     my_report_table.addCell(table_cell);
     table_cell=new PdfPCell(new Phrase("EMAIL"));
     my_report_table.addCell(table_cell);
     table_cell=new PdfPCell(new Phrase("PHONE"));
     my_report_table.addCell(table_cell);
     table_cell=new PdfPCell(new Phrase("SHIPPING ADDRESS"));
     my_report_table.addCell(table_cell);
     table_cell=new PdfPCell(new Phrase("PRODUCT NAME"));
     my_report_table.addCell(table_cell);
     table_cell=new PdfPCell(new Phrase("QTY"));
     my_report_table.addCell(table_cell);
     table_cell=new PdfPCell(new Phrase("PRICE"));
     my_report_table.addCell(table_cell);
     table_cell=new PdfPCell(new Phrase("TOTAL"));
     my_report_table.addCell(table_cell);
     table_cell=new PdfPCell(new Phrase("ORDER DATE"));
     my_report_table.addCell(table_cell);
     for(OrderDetail order: listOrder) {    
    	 		OrderDetail objOrder = order;

                     table_cell=new PdfPCell(new Phrase(objOrder.getOrder_code()));
                     my_report_table.addCell(table_cell);
                     table_cell=new PdfPCell(new Phrase(objOrder.getFullname()));
                     my_report_table.addCell(table_cell);
                     table_cell=new PdfPCell(new Phrase(objOrder.getEmail()));
                     my_report_table.addCell(table_cell);
                     table_cell=new PdfPCell(new Phrase(objOrder.getPhone()));
                     my_report_table.addCell(table_cell);
                     table_cell=new PdfPCell(new Phrase(objOrder.getShipping_address()));
                     my_report_table.addCell(table_cell);
                     table_cell=new PdfPCell(new Phrase(objOrder.getProduct_detail()));
                     my_report_table.addCell(table_cell);
                     table_cell=new PdfPCell(new Phrase(objOrder.getQty()));
                     my_report_table.addCell(table_cell);
                     table_cell=new PdfPCell(new Phrase(objOrder.getPrice()));
                     my_report_table.addCell(table_cell);
                     table_cell=new PdfPCell(new Phrase(objOrder.getTotal()));
                     my_report_table.addCell(table_cell);
                     table_cell=new PdfPCell(new Phrase(objOrder.getOrder_date().toString()));
                     my_report_table.addCell(table_cell);
                     
                     }
     /* Attach report table to PDF */
     my_pdf_report.add(my_report_table);                       
     my_pdf_report.close();
     
     /* Close all DB related objects */
              
 return pdf;    
}
 public void exportPdfFile(String templateFileName, Map<String, Object> data, String pdfFileName) throws com.lowagie.text.DocumentException, DocumentException {
        String htmlContent = generateHtml(templateFileName, data);
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(pdfFileName);
            ITextRenderer renderer = new ITextRenderer();
            renderer.setDocumentFromString(htmlContent);
            renderer.layout();
            renderer.createPDF(fileOutputStream, false);
            renderer.finishPDF();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    private String generateHtml(String templateFileName, Map<String, Object> data) {
        TemplateEngine templateEngine = createTemplateEngine();
        Context context = new Context();
        context.setVariables(data);
        String htmlContent = templateEngine.process(templateFileName, context);
        return htmlContent;
    }

    private TemplateEngine createTemplateEngine() {
        ClassLoaderTemplateResolver pdfTemplateResolver = new ClassLoaderTemplateResolver();
        pdfTemplateResolver.setPrefix("pdf-templates/");
        pdfTemplateResolver.setSuffix(".html");
        pdfTemplateResolver.setTemplateMode("HTML5");
        pdfTemplateResolver.setCharacterEncoding("UTF-8");
        pdfTemplateResolver.setOrder(1);

        TemplateEngine templateEngine = new TemplateEngine();
        templateEngine.setTemplateResolver(pdfTemplateResolver);
        return templateEngine;
    }
}
