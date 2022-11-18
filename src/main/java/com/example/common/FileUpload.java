package com.example.common;

import com.example.bean.WordVO;
import com.example.dao.WordDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class FileUpload {
    public WordVO uploadPhoto(HttpServletRequest request) {
        String filename="";
        int sizeLimit=15*1024*1024;

        String realPath = request.getServletContext().getRealPath("upload");
        File dir = new File(realPath);
        if(!dir.exists()) dir.mkdirs();

        WordVO one = null;
        MultipartRequest multipartRequest = null;

        try {
            multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
            // "photo"라는 이름으로 전송되어 업로드된 파일 이름 가져옴
            filename = multipartRequest.getFilesystemName("photo");

            one = new WordVO();
            String sid = multipartRequest.getParameter("wordID");
            if(sid!=null && !sid.equals("")) one.setId(Integer.parseInt(sid));
            one.setLevel(Integer.parseInt(multipartRequest.getParameter("level")));
            one.setName(multipartRequest.getParameter("name"));
            one.setDefinitionK(multipartRequest.getParameter("definitionK"));
            one.setDefinitionE(multipartRequest.getParameter("definitionE"));
            one.setSentence(multipartRequest.getParameter("sentence"));
            one.setWriter(multipartRequest.getParameter("writer"));
            one.setType(multipartRequest.getParameter("type"));

            if(sid!=null && !sid.equals("")) { //edit인 경우, 기존 파일과 비교해야 함
                WordDAO dao = new WordDAO();
                String oldfilename = dao.getPhotoFilename(Integer.parseInt(sid));
                // 새로 덮어씌울 파일이 전송된 경우, 이전 파일 제거
                if(filename!=null && oldfilename !=null) {
                    FileUpload.deleteFile(request, oldfilename);
                }
                // 새로운 파일이 없는 경우 이전 파일을 유지
                else if (filename==null && oldfilename !=null)
                    filename = oldfilename;
            }
            one.setPhoto(filename);
        } catch(IOException e) {
            e.printStackTrace();
        }
        return one;
    }

    public static void deleteFile(HttpServletRequest request, String filename) {
        String filePath = request.getServletContext().getRealPath("upload");

        File f = new File(filePath + "/" + filename);
        if(f.exists()) f.delete();
    }
}
