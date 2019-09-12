package testwebapp;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/*This class is used for storing the attachment from web page
 * This will store the attachments in a defined UPLOAD_DIRECTORY*/
@WebServlet(urlPatterns = "/uploadfile.do")
public class FileUploader extends SubmitEdits {

	

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request,response);
		
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		
		  //process only if its multipart content
        if(ServletFileUpload.isMultipartContent(request)){
            try {
            	final String UPLOAD_DIRECTORY = "/home/manjunath/Desktop/Codes/Images";
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
               
                for(FileItem item : multiparts){
                    if(!item.isFormField()){
                        String fileName = new File(item.getName()).getName();
                        item.write( new File(UPLOAD_DIRECTORY + File.separator + fileName));
                    }
                }
            
               //File uploaded successfully
               request.setAttribute("message", "File Uploaded Successfully");
            } catch (Exception ex) {
               request.setAttribute("message", "File Upload Failed due to " + ex);
            }          
          
        }else{
            request.setAttribute("message",
                                 "Sorry this Servlet only handles file upload request");
        }
		request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request,response);
		
}
}
