package service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import mybatis.MybatisMemberDaoImpl;
import pack.EmailDTO;

// 서비스 빈으로 등록
@Component
public class EmailService {

	@Autowired
	MybatisMemberDaoImpl dbPro;

	@Autowired
	JavaMailSender mailSender; // root-context.xml에 설정한 bean, 의존성을 주입

	public void SendEmail(EmailDTO email) throws Exception {
       MimeMessage mimeMessage = mailSender.createMimeMessage();
       try {
    	   MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, false, "euc-kr");
    	   String htmlMsg = email.getContent();
    	   
    	   mimeMessage.setContent(htmlMsg, "text/html; charset=UTF-8");
    	   helper.setText(htmlMsg, true);
    	   helper.setTo(email.getReceiver());
           helper.setSubject(email.getSubject());
           mimeMessage.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));
           mimeMessage.setFrom(new InternetAddress("SpringBooks@final.com", "스프리이이잉살라마이쿰"));
       }catch(MessagingException e) {
           System.out.println("MessagingException");
           e.printStackTrace();
       }
       try {
           mailSender.send(mimeMessage);
       }catch(MailException e) {
           System.out.println("MailException발생");
           e.printStackTrace();
       }
   }
}
