package spring.constant;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import jakarta.servlet.http.HttpServletRequest;
import spring.model.OrderDetail;

public class ExportExcel {
	
	public String exportOrderDetail(HttpServletRequest request, List<OrderDetail> listOrder){
		 String excelFilePath = "Reviews-export.xlsx";
		 try {
			XSSFWorkbook workbook = new XSSFWorkbook();
            XSSFSheet sheet = workbook.createSheet("Reviews");
 
            writeHeaderLine(sheet);
 
            writeDataLines(listOrder, workbook, sheet);
            String applicationPath = request.getServletContext().getRealPath("/WEB-INF/resources/gshock/");
            String basePath = applicationPath + File.separator + "export-excel" + File.separator; 
            File dir = new File(basePath);
    		if(!dir.exists()) {
    			dir.mkdirs();
    		}
            System.out.println(applicationPath);
            FileOutputStream outputStream;
            outputStream = new FileOutputStream(basePath+excelFilePath);
			workbook.write(outputStream);
			workbook.close();
            System.out.println("success");
		}  catch (SQLException e) {
            System.out.println("Datababse error:");
            e.printStackTrace();
        } catch (IOException e) {
            System.out.println("File IO error: The process cannot access the file because it is being used by another process");
            e.printStackTrace();
        }
		 return excelFilePath;
	}
	private void writeHeaderLine(XSSFSheet sheet) {
		 
        Row headerRow = sheet.createRow(0);
 
        Cell headerCell = headerRow.createCell(0);
        headerCell.setCellValue("Id");
 
        headerCell = headerRow.createCell(1);
        headerCell.setCellValue("Order Code");
 
        headerCell = headerRow.createCell(2);
        headerCell.setCellValue("Fullname");
 
        headerCell = headerRow.createCell(3);
        headerCell.setCellValue("Email");
 
        headerCell = headerRow.createCell(4);
        headerCell.setCellValue("Phone");
 
        headerCell = headerRow.createCell(5);
        headerCell.setCellValue("Shipping Address");
 
        headerCell = headerRow.createCell(6);
        headerCell.setCellValue("Product Detail");
 
        headerCell = headerRow.createCell(7);
        headerCell.setCellValue("Color");
 
        headerCell = headerRow.createCell(8);
        headerCell.setCellValue("Size");
        
        headerCell = headerRow.createCell(9);
        headerCell.setCellValue("Qty");
 
        headerCell = headerRow.createCell(10);
        headerCell.setCellValue("Price");
 
        headerCell = headerRow.createCell(11);
        headerCell.setCellValue("Images");
 
        headerCell = headerRow.createCell(12);
        headerCell.setCellValue("Subtotal");
 
        headerCell = headerRow.createCell(13);
        headerCell.setCellValue("Discount");
 
        headerCell = headerRow.createCell(14);
        headerCell.setCellValue("Transports");
 
        headerCell = headerRow.createCell(15);
        headerCell.setCellValue("Tax");
 
        headerCell = headerRow.createCell(16);
        headerCell.setCellValue("Total");
        
        headerCell = headerRow.createCell(17);
        headerCell.setCellValue("Order User");
 
        headerCell = headerRow.createCell(18);
        headerCell.setCellValue("Order Date");
 
        headerCell = headerRow.createCell(19);
        headerCell.setCellValue("Status");
    }
 
    private void writeDataLines(List<OrderDetail> list, XSSFWorkbook workbook,
            XSSFSheet sheet) throws SQLException {
        int rowCount = 1;
 
       for (OrderDetail order : list) {
        	OrderDetail objOrder = order;

            Row row = sheet.createRow(rowCount++);
 
            int columnCount = 0;
            Cell cell = row.createCell(columnCount++);
            cell.setCellValue(objOrder.getId());
 
            cell = row.createCell(columnCount++);
            cell.setCellValue(objOrder.getOrder_code());
            
            cell = row.createCell(columnCount++);
            cell.setCellValue(objOrder.getFullname());
            
            cell = row.createCell(columnCount++);
            cell.setCellValue(objOrder.getEmail());
            
            cell = row.createCell(columnCount++);
            cell.setCellValue(objOrder.getPhone());
            
            cell = row.createCell(columnCount++);
            cell.setCellValue(objOrder.getShipping_address());
            
            cell = row.createCell(columnCount++);
            cell.setCellValue(objOrder.getProduct_detail());
            
            cell = row.createCell(columnCount++);
            cell.setCellValue(objOrder.getColor());
            
            cell = row.createCell(columnCount++);
            cell.setCellValue(objOrder.getSize());
            
            cell = row.createCell(columnCount++);
            cell.setCellValue(objOrder.getQty());
            
            cell = row.createCell(columnCount++);
            cell.setCellValue(objOrder.getPrice());
            
            cell = row.createCell(columnCount++);
            cell.setCellValue(objOrder.getImages());
            
            cell = row.createCell(columnCount++);
            cell.setCellValue(objOrder.getSubtotal());
            
            cell = row.createCell(columnCount++);
            cell.setCellValue(objOrder.getDiscount());
            
            cell = row.createCell(columnCount++);
            cell.setCellValue(objOrder.getTransports());
            
            cell = row.createCell(columnCount++);
            cell.setCellValue(objOrder.getTax());
            
            cell = row.createCell(columnCount++);
            cell.setCellValue(objOrder.getTotal());
            
            cell = row.createCell(columnCount++);
            cell.setCellValue(objOrder.getOrder_user());
 
            cell = row.createCell(columnCount++);
 
            CellStyle cellStyle = workbook.createCellStyle();
            CreationHelper creationHelper = workbook.getCreationHelper();
            cellStyle.setDataFormat(creationHelper.createDataFormat().getFormat("yyyy-MM-dd HH:mm:ss"));
            cell.setCellStyle(cellStyle);
 
            cell.setCellValue(objOrder.getOrder_date());
        }
    }
}

