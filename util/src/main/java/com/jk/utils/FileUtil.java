package com.jk.utils;



import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.springframework.web.multipart.MultipartFile;

import sun.misc.BASE64Encoder;

public class FileUtil {

	 public static boolean generateImage(String imgStr,String imgFilePath){

	     if (imgStr == null) 
	         return false;
	  
	     try 
	     {
	        
	         byte[] b = Base64.decodeBase64(imgStr);
	         for(int i=0;i<b.length;++i)
	         {
	             if(b[i]<0)
	             {
	                 b[i]+=256;
	             }
	         }

	
	         OutputStream out = new FileOutputStream(imgFilePath);    
	         out.write(b);
	         out.flush();
	         out.close();
	         return true;
	     } 
	     catch (Exception e) 
	     {
	         return false;
	     }
	 }

	public static String getImgStr(String imgFile){

	
	    
	    InputStream in = null;
	    byte[] data = null;

	    try 
	    {
	        in = new FileInputStream(imgFile);        
	        data = new byte[in.available()];
	        in.read(data);
	        in.close();
	    } 
	    catch (IOException e) 
	    {
	        e.printStackTrace();
	    }
	    return new String(Base64.encodeBase64(data));
	}
	

	public static String binaryToBase64Str(byte[] bytes){
		return new BASE64Encoder().encodeBuffer(bytes).trim();
	}
	

	public static byte[] base64(File img) throws IOException {
		BufferedImage bi = ImageIO.read(img);    
		ByteArrayOutputStream baos = new ByteArrayOutputStream();    
		ImageIO.write(bi, "jpg", baos);    
		byte[] bytes = baos.toByteArray();   
		System.out.println(bytes);

		return bytes;
	}
	

	public static String fileUpload(File srcFile, String srcFileName, String path) {

		FileInputStream is = null;
		FileOutputStream os = null;
		String newFilName = null;
		try {

			is = new FileInputStream(srcFile);

			String hz = srcFileName.substring(srcFileName.lastIndexOf("."));
			newFilName = UUID.randomUUID() + hz;

			File pathFile = new File(path);
			if (!pathFile.exists()) {
				pathFile.mkdirs();
			}

			File newFile = new File(path + "\\" + newFilName);

			os = new FileOutputStream(newFile);

			int b = is.read();
			while (b != -1) {
				os.write(b);
				b = is.read();
			}
		} catch (FileNotFoundException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		} finally {
			try {
				if (os != null) {
					os.close();
				}
			} catch (IOException e) {

				e.printStackTrace();
			}
			try {
				if (is != null) {
					is.close();
				}
			} catch (IOException e) {

				e.printStackTrace();
			}
		}
		return newFilName;
	}
	
	public static String upFile(MultipartFile img, String filePath) {

		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		FileInputStream is = null;
		BufferedInputStream bis = null;
		File file = new File(filePath);
		if (!file.exists()) {
			file.mkdirs();
		}
		String realName = img.getOriginalFilename();
		String type = realName.substring(realName.lastIndexOf("."),realName.length());
		String uuidName = UUID.randomUUID().toString()+type;
		File f = new File(filePath + "/" + uuidName);
		try {
			is = (FileInputStream) img.getInputStream();
			bis = new BufferedInputStream(is);
			fos = new FileOutputStream(f);
			bos = new BufferedOutputStream(fos);
			int bytesRead = 0;
			byte[] buffer = new byte[4096];
			while ((bytesRead  = bis.read(buffer)) != -1) {
				bos.write(buffer, 0, bytesRead);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				if (null != bos) {
					bos.close();
					bos = null;
				}
				if (null != fos) {
					fos.close();
					fos = null;
				}
				if (null != is) {
					is.close();
					is = null;
				}

				if (null != bis) {
					bis.close();
					bis = null;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return uuidName;
	}

	public static void downloadFile(HttpServletRequest request,
			HttpServletResponse response, String filePath, String fileName) {
		BufferedInputStream bis = null;
		InputStream is = null;
		OutputStream os = null;
		BufferedOutputStream bos = null;
		try {
			File file = new File(filePath);
			is = new FileInputStream(file);
			os = response.getOutputStream();
			bis = new BufferedInputStream(is);
			bos = new BufferedOutputStream(os);

			if (request.getHeader("User-Agent").toLowerCase()
					.indexOf("firefox") > 0) {
				fileName = new String(fileName.getBytes("GB2312"), "ISO-8859-1");
			} else {

				fileName = java.net.URLEncoder.encode(fileName, "UTF-8");
				fileName = new String(fileName.getBytes("UTF-8"), "GBK");
			}

			response.reset();
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/x-msdownload");


			response.setHeader("Content-Disposition", "attachment;filename="
					+ fileName);

			int bytesRead = 0;
			byte[] buffer = new byte[4096];
			while ((bytesRead = bis.read(buffer)) != -1) {
				bos.write(buffer, 0, bytesRead);
			}

		} catch (Exception ex) {
			throw new RuntimeException(ex.getMessage());
		} finally {

			try {
				if (null != bis) {
					bis.close();
					bis = null;
				}
				if (null != bos) {
					bos.close();
					bos = null;
				}
				if (null != is) {
					is.close();
					is = null;
				}
				if (null != os) {
					os.close();
					os = null;
				}
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
	}

	public static void fileDownLoad(HttpServletRequest request, HttpServletResponse response, String fileName) {
		InputStream is = null;
		OutputStream os = null;
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		try {
			is = new FileInputStream(request.getRealPath("upload") + "/" + fileName);
			bis = new BufferedInputStream(is);
			os = response.getOutputStream();
			bos = new BufferedOutputStream(os);

			if (request.getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0) {
				fileName = new String(fileName.getBytes("GB2312"), "ISO-8859-1");
			} else {

				fileName = java.net.URLEncoder.encode(fileName, "UTF-8");
				fileName = new String(fileName.getBytes("UTF-8"), "GBK");
			}

			response.reset();
			response.setContentType("application/x-msdownload");



			response.setHeader("Content-Disposition", "attachment;filename=" + fileName);

			byte[] b = new byte[4096];
			int s = 0;
			while ((s = bis.read(b)) != -1) {
				bos.write(b, 0, s);
				bos.flush();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {

			try {
				if (bos != null) {
					bos.flush();
					bos.close();
					bos = null;
				}

				if (os != null) {
					os.flush();
					os.close();
					os = null;
				}

				if (bis != null) {
					bis.close();
					bis = null;
				}
				if (is != null) {
					is.close();
					is = null;
				}

			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
