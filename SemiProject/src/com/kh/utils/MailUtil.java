package com.kh.utils;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.kh.member.model.vo.Member;

public class MailUtil {
   
   public static String certification;

   public static String sendMailToNewMember(String mail) {   
        Properties properties = System.getProperties();
        properties.put("mail.smtp.starttls.enable", "true");     // gmail은 true 고정
        properties.put("mail.smtp.host", "smtp.naver.com");      // smtp 서버 주소
        properties.put("mail.smtp.auth", "true");                 // gmail은 true 고정
        properties.put("mail.smtp.port", "587");                 // 네이버 포트
        properties.put("mail.smtp.port", "587");                 // 네이버 포트
           
        Authenticator auth = new MyAuthentication();
        
        //session 생성 및  MimeMessage생성
        Session session = Session.getDefaultInstance(properties, auth);
        MimeMessage msg = new MimeMessage(session);
         
        try{
            //편지보낸시간
            msg.setSentDate(new Date());
            InternetAddress from = new InternetAddress() ;
            from = new InternetAddress("ehd385@naver.com"); //관리자 아이디
            // 이메일 발신자
            msg.setFrom(from);
            // 이메일 수신자
            InternetAddress to = new InternetAddress(mail);
            msg.setRecipient(Message.RecipientType.TO, to);
            // 이메일 제목
            msg.setSubject("[또오개냥] 인증번호 발송", "UTF-8");
            // 이메일 인증 6자리 설정 
            certification = RandomNumberUtil.makeRandomNumber();
            // 이메일 내용
            msg.setText("인증번호 6자리를 확인 후 화면에 입력해주세요 : " + certification, "UTF-8");
            // 이메일 헤더
            msg.setHeader("content-Type", "text/html");
            //메일보내기
            javax.mail.Transport.send(msg, msg.getAllRecipients());
            
            return certification;
             
        }catch (AddressException addr_e) {
            addr_e.printStackTrace();
        }catch (MessagingException msg_e) {
            msg_e.printStackTrace();
        }catch (Exception msg_e) {
            msg_e.printStackTrace();
        }
      return certification;
    }
   
   public static void sendMailToSearchPwdMember(String mail, String randomPwd) {   
        Properties properties = System.getProperties();
        properties.put("mail.smtp.starttls.enable", "true");     // gmail은 true 고정
        properties.put("mail.smtp.host", "smtp.naver.com");      // smtp 서버 주소
        properties.put("mail.smtp.auth", "true");                // gmail은 true 고정
        properties.put("mail.smtp.port", "587");                 // 네이버 포트
        properties.put("mail.smtp.port", "587");                 // 네이버 포트
           
        Authenticator auth = new MyAuthentication();
        
        //session 생성 및  MimeMessage생성
        Session session = Session.getDefaultInstance(properties, auth);
        MimeMessage msg = new MimeMessage(session);
         
        try{
            //편지보낸시간
            msg.setSentDate(new Date());
            InternetAddress from = new InternetAddress() ;
            from = new InternetAddress("ehd385@naver.com"); //관리자 아이디
            // 이메일 발신자
            msg.setFrom(from);
            // 이메일 수신자
            InternetAddress to = new InternetAddress(mail);
            msg.setRecipient(Message.RecipientType.TO, to);
            // 이메일 제목
            msg.setSubject("[또오개냥] 임시 비밀번호 발송", "UTF-8");
            // 이메일 내용
            msg.setText("임시 비밀번호 : " + randomPwd, "UTF-8");
            // 이메일 헤더
            msg.setHeader("content-Type", "text/html");
            //메일보내기
            javax.mail.Transport.send(msg, msg.getAllRecipients());
            
             
        }catch (AddressException addr_e) {
            addr_e.printStackTrace();
        }catch (MessagingException msg_e) {
            msg_e.printStackTrace();
        }catch (Exception msg_e) {
            msg_e.printStackTrace();
        }
    }
}


//관리자 권한 설정 클래스 
class MyAuthentication extends Authenticator {
      
    PasswordAuthentication pwdAuth;
    public MyAuthentication(){
         
    	//관리자 이메일
       //관리자 이메일
        String email = "ehd385@naver.com";  //이메일
        String pwd = "zhdkffk1!";        //비밀번호
 
        // ID와 비밀번호를 입력한다.
        pwdAuth = new PasswordAuthentication(email, pwd);
    }
 
    // 시스템에서 사용하는 인증정보
    public PasswordAuthentication getPasswordAuthentication() {
        return pwdAuth;
    }
}