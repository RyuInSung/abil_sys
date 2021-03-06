package kr.or.ddit.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.MediaType;
import org.springframework.web.servlet.View;

import kr.or.ddit.util.MakeFileName;

public class FileDownloadView implements View {
	private String contentType = MediaType.APPLICATION_OCTET_STREAM_VALUE;

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	@Override
	public String getContentType() {
		return this.contentType;
	}

	@Override
	public void render(Map<String, ?> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String savePath = (String) model.get("savePath");
		String saveName = (String) model.get("saveName");

		File downloadFile = new File(savePath + File.separator + saveName);

		FileInputStream inStream = new FileInputStream(downloadFile);

		ServletContext context = request.getServletContext();
		String mimeType = context.getMimeType(downloadFile.getName());

		if (mimeType != null) {
			this.contentType = mimeType;
		}

		response.setContentType(mimeType);
		response.setContentLength((int) downloadFile.length());

		String headerKey = "Content-Disposition";

		String sendFileName = MakeFileName.parseFileNameFromUUID(downloadFile.getName(), "\\$\\$");

		String header = request.getHeader("User-Agent");

		if (header.contains("MISE")) {
			sendFileName = URLEncoder.encode(sendFileName, "UTF-8");
		} else {
			sendFileName = new String(sendFileName.getBytes("UTF-8"), "ISO-8859-1");
		}

		String headerValue = String.format("attachment; filename=\"%s\"", sendFileName);
		response.setHeader(headerKey, headerValue);

		OutputStream outStream = response.getOutputStream();
		byte[] buffer = new byte[4096];
		int byteRead = -1;

		while ((byteRead = inStream.read(buffer)) != -1) {
			outStream.write(buffer, 0, byteRead);
		}

		inStream.close();
		outStream.close();
	}
}
