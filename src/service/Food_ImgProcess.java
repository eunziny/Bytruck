package service;

import java.io.File;

import java.io.UnsupportedEncodingException; //지원하지 않는 인코딩일때 발생하는 예외 

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import vo.Foodtruck_Location;

public class Food_ImgProcess {
	private HttpServletRequest request;

	public Food_ImgProcess(HttpServletRequest request) {
		this.request = request;
	}
	
	public Foodtruck_Location upload() {
		
		Foodtruck_Location fc = new Foodtruck_Location();
		
		//Post(어플리케이션 방식과 멀티파트 방식)
		//파일 업로드는 멀티파트 방식 
		if (ServletFileUpload.isMultipartContent(request)) {
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload fileUpload = new ServletFileUpload(factory);

			List<FileItem> fileItemList = null;
			try {
				fileItemList = fileUpload.parseRequest(request); //전송된 파일과 텍스트를 저장(fileItemList)	
			} catch (FileUploadException e) {
				e.printStackTrace();
				
			}
			for (int i = 0; i < fileItemList.size(); i++) {
				FileItem fileItem = (FileItem) fileItemList.get(i);
				if (fileItem.isFormField()) { //isFormField()는 텍스트인지 판단
					String name = fileItem.getFieldName(); //양식의 이름 뽑아서 저장
					String value = null;
					try {
						value = fileItem.getString("UTF-8");
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
					if (name.equals("title")) {
						fc.setTitle(value);
					} else if (name.equals("foodtype")){
						fc.setFoodtype(value);
					} else if (name.equals("opendate")){
						fc.setOpendate(value);
					} else if (name.equals("detail")){
						fc.setDetail(value);
					} else if (name.equals("powerlink")){
						fc.setPoweryn(value);
					} else if (name.equals("xlocation")) {
						fc.setLatitude(value);
					} else if (name.equals("ylocation")) {
						fc.setLongtitude(value);
					}
				} else {
					String name = fileItem.getFieldName();
					if((name.equals("newfile")&&fileItem.getSize()>0)||name.equals("file1")) {
						int idx = fileItem.getName().lastIndexOf("\\"); //마지막 역슬래시의 위치 (파일명만 짤라오고)
					
						if (idx == -1) { //만약에 파일(마지막 슬래시의 위치를 찾거나 )
							idx = fileItem.getName().lastIndexOf("/");
						}
						String fileName = fileItem.getName().substring(idx + 1); //파일명만 짤라오고
						System.out.println(fileName);
						try {
							File uploadedFile = new File("D:\\apache-tomcat-8.5.30\\wtpwebapps\\bytruck\\upload", fileName);
							fileItem.write(uploadedFile);
						
							fc.setImgpath(uploadedFile.getAbsolutePath());
							System.out.println("newfile:" + fc.getImgpath());
						} catch (Exception ex) {
							ex.printStackTrace();
						}
					}else{
						System.out.println("else()");
						if(name.equals("oldfile")) {
							int idx = fileItem.getName().lastIndexOf("\\"); //마지막 역슬래시의 위치 (파일명만 짤라오고)
							
							if (idx == -1) { //만약에 파일(마지막 슬래시의 위치를 찾거나 )
								idx = fileItem.getName().lastIndexOf("/");
							}
							String fileName = fileItem.getName().substring(idx + 1); //파일명만 짤라오고
							System.out.println(fileName);
							try {
								File uploadedFile = new File("D:\\apache-tomcat-8.5.30\\wtpwebapps\\bytruck\\upload", fileName);
								fileItem.write(uploadedFile);
							
								fc.setImgpath(uploadedFile.getAbsolutePath());
								System.out.println("oldfile : "+fc.getImgpath());
							} catch (Exception ex) {
								ex.printStackTrace();
							}
						}
					}
				}
			}
		}
		return fc;
	}
}