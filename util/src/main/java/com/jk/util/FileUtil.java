package com.jk.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;


public class FileUtil {
	/**
	 * <pre>upLoad(用于上传文件)   
	 * 创建人：魏永生     
	 * 创建时间：2017-4-14 下午3:48:04    
	 * 修改人：魏永生       
	 * 修改时间：2017-4-14 下午3:48:04    
	 * 修改备注： 
	 * @param flie  前台传过来的文件
	 * @param fileName 前台传过来的文件名
	 * @param folderName 要上传到的文件夹名称
	 * @return  文件的相对路径</pre>
	 */
	public static String upLoad(MultipartFile multiflie,String fileName,String folderName,HttpServletRequest request){
		
		CommonsMultipartFile cf = (CommonsMultipartFile)multiflie;   
        DiskFileItem fi = (DiskFileItem) cf.getFileItem();  
        File flie = fi.getStoreLocation(); 
		
		BufferedInputStream bis =null;
		BufferedOutputStream bos = null;
		String url="http://localhost:8091";
		try {
			//读取文件  就是输入流
			FileInputStream in = new FileInputStream(flie);
			//创建缓冲输入流   提高效率
			bis= new BufferedInputStream(in);
			//获取项目的真实路径
			String realPath="E:/tomcat8091/webapps/image";
			
			//判断要写入的文件夹是否存在
			File file = new File(realPath);
			if(!file.exists()){ //判断文件是否存在
				file.mkdir(); //根据文件的路径  创建文件夹
			}
			//重命名文件名  保证文件的唯一性
			String newFileName = UUID.randomUUID()+"_"+fileName;
			String contextPath = request.getContextPath();
			url+="/"+folderName+"/"+newFileName;
			//写文件  就是输出流
			FileOutputStream out = new FileOutputStream(realPath+"\\"+newFileName);
			//创建缓冲输出流 提高效率
			bos = new BufferedOutputStream(out);
			//把上传的文件写入到指定文件内  
			byte[] b =  new byte[1024];
			while(bis.read(b) != -1){
				bos.write(b);
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			//关闭流
			try {
				if(bis != null){
					bis.close();
				}
				if(bos != null){
					bos.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return url;
	}
	/**
	 * <pre>upLoad(用于上传文件)   
	 * 创建人：魏永生     
	 * 创建时间：2017-4-14 下午3:48:04    
	 * 修改人：魏永生       
	 * 修改时间：2017-4-14 下午3:48:04    
	 * 修改备注： 
	 * @param flie  前台传过来的文件
	 * @param fileName 前台传过来的文件名
	 * @param folderName 要上传到的文件夹名称
	 * @return  文件的相对路径</pre>
	 */
	public static String upLoad(File flie,String fileName,String folderName,HttpServletRequest request){
		BufferedInputStream bis =null;
		BufferedOutputStream bos = null;
		String url="";
		try {
			//读取文件  就是输入流
			FileInputStream in = new FileInputStream(flie);
			//创建缓冲输入流   提高效率
			bis= new BufferedInputStream(in);
			//获取项目的真实路径
			String realPath = request.getSession().getServletContext().getRealPath("/"+folderName);
			//判断要写入的文件夹是否存在
			File file = new File(realPath);
			if(!file.exists()){ //判断文件是否存在
				file.mkdir(); //根据文件的路径  创建文件夹
			}
			//重命名文件名  保证文件的唯一性
			String newFileName = UUID.randomUUID()+"_"+fileName;
			String contextPath = request.getContextPath();
			url+="/"+folderName+"/"+newFileName;
			//写文件  就是输出流
			FileOutputStream out = new FileOutputStream(realPath+"\\"+newFileName);
			//创建缓冲输出流 提高效率
			bos = new BufferedOutputStream(out);
			//把上传的文件写入到指定文件内  
			byte[] b =  new byte[1024];
			while(bis.read(b) != -1){
				bos.write(b);
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			//关闭流
			try {
				if(bis != null){
					bis.close();
				}
				if(bos != null){
					bos.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return url;
	}
	// 下载文件
	/**
	 * <pre>downLoad(下载指定文件)   
	 * 创建人：魏永生     
	 * 创建时间：2017-4-14 下午3:49:40    
	 * 修改人：魏永生       
	 * 修改时间：2017-4-14 下午3:49:40    
	 * 修改备注： 
	 * @param filePath 数据库存储的路径</pre>
	 */
	public static void downLoad(String filePath,HttpServletRequest request ,HttpServletResponse response){
		// 1. 获得文件的真实路径
		String newPath = request.getSession().getServletContext().getRealPath(filePath);
		// 2. 实例化 文件对象  
		File f = new File(newPath);
		// 3. 获得文件名
		String fileName = f.getName();
		// 4. 定义输入输出流
		BufferedInputStream buffIn = null;
		BufferedOutputStream buffOut = null;
		try {
			// 5. 获得输入流
			buffIn = new BufferedInputStream(new FileInputStream(f));
			// 6. 获得 response  和  request (获得 request 和 response )
			// 7. 获得输入流       response.getOutputStream() 是servlet的输出流  浏览器的输出流
			buffOut = new BufferedOutputStream(response.getOutputStream());
			
			// 8. 对浏览器进行设置========================================================
			//解决浏览器兼容问题
	        if (request.getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0) {
	        	fileName = new String(fileName.getBytes("GB2312"),"ISO-8859-1");
	        } else {
	        	// 对文件名进行编码处理中文问题
	        	fileName = java.net.URLEncoder.encode(fileName, "UTF-8");// 处理中文文件名的问题
	        	fileName = new String(fileName.getBytes("UTF-8"), "GBK");// 处理中文文件名的问题
	        }
	        response.reset();
	        response.setContentType("application/x-msdownload");// 不同类型的文件对应不同的MIME类型
		     // inline在浏览器中直接显示，不提示用户下载
		        // attachment弹出对话框，提示用户进行下载保存本地
		        // 默认为inline方式
	        response.setHeader("Content-Disposition", "attachment;filename="+fileName);
			//==========================================================================
			// 9. 循环 读写 赋值
			byte[] b = new byte[1024];
			int s = 0;
			while((s=buffIn.read(b))!=(-1)){
				buffOut.write(b);
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			try {
				if(buffIn!=null){
					buffIn.close();
				}
				if(buffOut!=null){
					buffOut.close();
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	} 
	/**
	 * <pre>deleteFile(这里用一句话描述这个方法的作用)   
	 * 创建人：魏永生     
	 * 创建时间：2017-4-14 下午3:53:52    
	 * 修改人：魏永生       
	 * 修改时间：2017-4-14 下午3:53:52    
	 * 修改备注： 
	 * @param filePath  数据库存储的路径
	 * @return 
	 * 删除失败返回  false  路径下文件不存在  返回false
	 * 删除成功返回 true </pre>
	 */
	public static boolean deleteFile(String filePath,HttpServletRequest request){
		//获取物理路径
		String newPath = request.getSession().getServletContext().getRealPath(filePath);
		//实例化 文件
		File file = new File(newPath);
		//判断路径 和  文件是否存在
		if(file.exists() && file.isFile()){
			if(file.delete()){
				return true;
			}else{
				return false;
			}
		}else{
			return false;
		}
	}
}
