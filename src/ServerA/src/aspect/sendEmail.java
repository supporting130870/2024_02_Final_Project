package aspect;

import model.DAO_DB;
import remoteInterface.ISendEmail;
import valueObject.VUser;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.rmi.RemoteException;
import java.util.Properties;
import java.util.Random;

public class sendEmail implements ISendEmail {

    private static final String FROM_EMAIL = ""; // 발신자 이메일
    private static final String PASSWORD = "";    // 이메일 비밀번호

    // 랜덤 코드 생성
    public String generateRandomCode(int length) {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        StringBuilder code = new StringBuilder();
        Random random = new Random();

        for (int i = 0; i < length; i++) {
            code.append(characters.charAt(random.nextInt(characters.length())));
        }

        return code.toString();
    }

    // 이메일 전송
    public void sendEmail(String toEmail, String subject, String body) {
        // SMTP 서버 설정
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // 이메일 인증
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM_EMAIL, PASSWORD);
            }
        });

        try {
            // 이메일 작성
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(FROM_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject(subject);
            message.setText(body);

            // 이메일 전송
            Transport.send(message);
            System.out.println("이메일이 성공적으로 발송되었습니다!");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public VUser findIdByEmail(String email) throws RemoteException {
        DAO_DB dao = new DAO_DB();
        return dao.getUserByEmail(email); // 이메일로 아이디 찾기


    }
}
