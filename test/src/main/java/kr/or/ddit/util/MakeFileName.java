package kr.or.ddit.util;

import java.util.UUID;

public class MakeFileName {
	// 만들기
	public static String toUUIDFileName(String fileName, String delimiter) {
		String uuid = UUID.randomUUID().toString().replace("-", "");
		return uuid + delimiter + fileName;
	}

	// 파일이름만 뽑아내기
	public static String parseFileNameFromUUID(String fileName, String delimiter) {
		String[] uuidFileName = fileName.split(delimiter);
		return uuidFileName[uuidFileName.length - 1]; // 배열[배열의크기-1];
	}

}
