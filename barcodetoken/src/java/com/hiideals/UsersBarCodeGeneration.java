package com.hiideals;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Image;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.Barcode128;
import com.lowagie.text.pdf.PdfContentByte;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

public class UsersBarCodeGeneration {
	
	 public  void createPdf(String dest,String code, int noOfBarcodes,String phoneNo,String name,String Adhaar) throws IOException, DocumentException {
	        Document document = new Document();
	        File file = new File(dest);
	        file.getParentFile().mkdirs();
	        PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(dest));
	        document.open();
	        float[] columnWidths = {25};
	        PdfPTable table = new PdfPTable(columnWidths);
	        PdfContentByte cb = writer.getDirectContent();
	        Barcode128 code128 = new Barcode128();
	        code128.setCode(code);
	        code128.setCodeType(Barcode128.CODE128);
	        Image code128Image = code128.createImageWithBarcode(cb, null, null);
	        noOfBarcodes=noOfBarcodes;
	        for (int i = 0; i < noOfBarcodes; i++) {
	            PdfPCell cell = new PdfPCell(code128Image, true);	
	            cell.setPaddingTop(10);
	            cell.setBorder(Rectangle.NO_BORDER);
	            cell.setFixedHeight(50);
	            table.addCell(cell);
			}
	        
			document.add(new Paragraph("This Barcode is for PhoneNumber :  "+phoneNo+" Name  : "+name+" AAdhar Number : "+Adhaar));
	        document.add(table);
	        document.close();
	    }
	    
	    public static void main(String[] args) {
			
	    	ArrayList<String > arr=new ArrayList<String>();
	    	arr.add("Asasd");
	    	
	    	
		}
	    
	    
	}
