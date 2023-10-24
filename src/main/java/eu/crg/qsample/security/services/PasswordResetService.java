package eu.crg.qsample.security.services;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import eu.crg.qsample.mail.Mail;
import eu.crg.qsample.mail.MailService;
import eu.crg.qsample.security.model.PasswordResetToken;
import eu.crg.qsample.security.model.User;

import freemarker.template.TemplateException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;

@Service
public class PasswordResetService {
    @Value("${email-conf.address}")
    private String emailAddress;

    @Value("${email-conf.app-url}")
    private String appUrl;

    @Autowired private MailService emailService;

    public void sendPasswordResetHtmlEmail(PasswordResetToken token) {
        Mail mail = new Mail();
        mail.setFrom(emailAddress);
        mail.setTo(new String[] {token.getUser().getUsername()});
        mail.setSubject("QSample - Password reset");

        Map<String, String> model = new HashMap<>();
        model.put("name", token.getUser().getFirstname());
        model.put("token", token.getToken().toString());
        model.put("appUrl", appUrl);

        ObjectMapper objectMapper = new ObjectMapper();
        String churro = null;
        token.setUser(createUserToSend(token.getUser()));
        try {
            churro = Base64.getEncoder().encodeToString(objectMapper.writeValueAsBytes(token));
        } catch (JsonProcessingException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        model.put("base", churro);

        mail.setModel(model);

        try {
            emailService.sendPasswordResetHtmlMessage(mail);
        } catch (MessagingException | IOException | TemplateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    private User createUserToSend(User user) {
        User u = new User();
        u.setApiKey(user.getApiKey());
        return u;
    }
}
