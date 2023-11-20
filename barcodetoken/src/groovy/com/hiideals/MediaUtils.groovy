package com.hiideals

import com.hiideals.BarcodeMedia

import com.hiideals.UsersBarCodeGeneration
import com.sun.org.apache.xml.internal.resolver.helpers.PublicId;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

class MediaUtils {

public  getMediaInstance(params,CommonsMultipartFile imageFile,String imageFor){
		BarcodeMedia mediaInstance=new BarcodeMedia(params);
		mediaInstance.imagePath=getImagePath(params, imageFor)
		if(imageFor!='Barcode')
		{
			transferFile(imageFile,mediaInstance.imagePath)
		}
		return mediaInstance.save(flush:true,failOnError:true)
	}



	public static getImagePath(params,String imageFor){

		String path;
		//StudentDetails sts=StudentDetails.findByStusnNumber(params?.stusnNumber)
		if(imageFor.equalsIgnoreCase('Barcode')){
			//println"stssss  :  "+params
			path="/opt/token/media/usersBarcode/"+params?.uniqueNo+".pdf"
			UsersBarCodeGeneration bg=new UsersBarCodeGeneration()
			//bg.createPdf(path, params.barcodeNumber.toString(),params.int('20'),sts.stName.toString())
			bg.createPdf(path, params?.uniqueNo,Integer.parseInt("1"),params.phoneNo.toString(),params?.name.toString(),params?.adharNum.toString())
		}
		
		createImagePath(path)
		return path;
	}

	public static createImagePath(path){
		File directory=new File(path)
		if(!directory.exists())
			directory.mkdirs()
	}

	public static transferFile(CommonsMultipartFile imageFile,String imagePath){
		try{
			imageFile.transferTo(new File(imagePath))
		}catch(Exception e){
			println "Exception while transfering image file to destination"
		}
	}
	
	
	

}