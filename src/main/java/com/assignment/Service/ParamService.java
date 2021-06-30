package com.assignment.Service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ParamService {
	@Autowired
	HttpServletRequest request;

	@Autowired
	ServletContext app;
	public String getString(String name, String defaultValue) {
		String value = request.getParameter(name);
		return value != null ? value : defaultValue;
	}

	public int getInt(String name, int defaultValue) {
		String value = getString(name, String.valueOf(defaultValue));
		return Integer.parseInt(value);
	}

	public double getDouble(String name, double defaultValue) {
		String value = getString(name, String.valueOf(defaultValue));
		return Double.parseDouble(value);
	}

	public boolean getBoolean(String name, boolean defaultValue) {
		String value = getString(name, String.valueOf(defaultValue));
		return Boolean.parseBoolean(value);
	}
	
	public Date getDate(String name,String patten) {
		String value = getString(name, "");
		try {
			return new SimpleDateFormat(patten).parse(value);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException(e);
		}
	}
	
	public String saveFile(MultipartFile file, String path) {
		File dir = new File(app.getRealPath(path));
		if (!dir.exists()) {
			dir.mkdir(); 
		}
		try {
			File saveFile = new File(dir, file.getOriginalFilename());
			System.out.println(saveFile);
			file.transferTo(saveFile);
			return file.getOriginalFilename();
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
		
	}
}

