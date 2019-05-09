package template;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class mailing {

	public static void email(String rx, String subj, String mess) {
		
		String to = rx;
		String from = "das.shubhashish.39@gmail.com";
		String frompass = "ajt1997dmw*#";
		
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", 587);
		
		Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() 
		{
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, frompass);

			}

		});
		
		try {

			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject(subj);
			message.setText(mess);
			Transport.send(message);
			System.out.println("Sent msg successfully....");

		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
	}
	
	
}
