package com.kh.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.kh.mvc.board.model.service.BoardService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/imageUpload")
public class CKEdit_ImgUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CKEdit_ImgUploadServlet() {
    }

//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = getServletContext().getRealPath("/ckedit_down");
		int maxSize = 1024 * 1024 * 10;
		String img = null;
		String encoding = "UTF-8";
		
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new DefaultFileRenamePolicy());

		String fileName = mr.getFilesystemName("upload");
		String upfileName = mr.getOriginalFileName("upload");		
				
		response.setContentType("application/json; charset=utf-8");
		
		JsonObject jsonObject = new JsonObject();
		
		String url = request.getContextPath() + "/ckedit_down/" + upfileName;
		
		jsonObject.addProperty("uploaded", 1);
		jsonObject.addProperty("fileName", fileName);
		jsonObject.addProperty("url", url);		
	
		
		response.getWriter().print(jsonObject);	
		
	
	}

}
