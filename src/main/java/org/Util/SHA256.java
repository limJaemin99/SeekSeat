package org.Util;

import java.security.MessageDigest;

//1234 -> 해쉬 ABCD$&^#*@&#^@&*#^&@#123123

//해쉬암호 : SHA256, HMAC256
//암호화 + 복호화 : Base64
public class SHA256 {
	//소금(salt) 문자열 정의
	//이 msalt 해시 작업을 더 안전하게 만들기 위해 사용, msalt 일반적으로 사용자별로 다르게 생성되며, 같은 입력에 대해 항상 다른 해시를 생성하도록 도와줌.
	private final static String msalt = "코스";
	
	// 입력된 문자열을 SHA-256 해시로 변환하여 반환
	public static String encodeSha256(String source) {
	// 결과 문자열 초기화
      String result = "";
      
      //입력된 문자열을 바이트 배열로 변환
      byte[] a = source.getBytes();
      //msalt 문자열을 바이트 배열로 변환
      byte[] salt = msalt.getBytes();
      //입력 문자열과 msalt 합친 새로운 바이트 배열 생성
      byte[] bytes = new byte[a.length + salt.length];
      
      //입력 문자열 바이트를 새로운 배열 처음에 복사
      System.arraycopy(a, 0, bytes, 0, a.length);
      //msalt 바이트를 새로운 배열에 입력 문자열 뒤에 복사
      System.arraycopy(salt, 0, bytes, a.length, salt.length);
      
      //SHA-256 암호화 작업을 시도하고 예외가 발생하면 처리
      try {
    	  //SHA-256 해시 알고리즘을 사용하는 MessageDigest 객체 생성
    	  MessageDigest md = MessageDigest.getInstance("SHA-256");
    	  //bytes 배열의 데이터 해싱
          md.update(bytes);
          
          //해싱된 데이터를 바이트 배열로 얻음
          byte[] byteData = md.digest();
          
          //결과를 저장할 문자열 버퍼 생성
          StringBuffer sb = new StringBuffer();
          //해싱된 바이트 배열을 문자열로 변환
          for (int i = 0; i < byteData.length; i++) {
              sb.append(Integer.toString((byteData[i] & 0xFF) + 256, 16).substring(1));
          }
          //최종 결과 문자열 설정
          result = sb.toString();
      } catch (Exception e) {
          e.printStackTrace();
      }
      
      //SHA-256으로 암호화된 해시값 반환
      return result;
  }

}