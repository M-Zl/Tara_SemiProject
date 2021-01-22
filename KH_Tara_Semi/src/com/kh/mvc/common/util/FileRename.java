package com.kh.mvc.common.util;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class FileRename implements FileRenamePolicy{
	
	@Override
	public File rename(File oldFile) {		
		File newFile = null;
		int randomNum = 0;
		LocalDateTime dateTime = null;
		String oriName = null;
		String newName = null;
		String extension = null;	
		int dot = -1;
		
		do { 
			dateTime = LocalDateTime.now();					
			randomNum = (int)(Math.random() * 1000);			 
			oriName = oldFile.getName(); 
			extension = "";			
			dot = oriName.lastIndexOf(".");
			
			if(dot > -1) {
				extension = oriName.substring(dot); 
			}
			
			newName = dateTime.format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS")) + "_" + randomNum + extension;
			newFile = new File(oldFile.getParent(), newName);			
		} while (!createNewFile(newFile));
		
		return newFile;
	}
	
	private boolean createNewFile(File file) {
		try {
			return file.createNewFile();
		}catch(IOException e) {
			return false;
		}
	}

		
	
}











