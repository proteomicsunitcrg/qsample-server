package eu.crg.qsample.mail;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import eu.crg.qsample.file.RequestFile;
import eu.crg.qsample.security.model.User;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

@Service
public class MailService {

    @Autowired
    private JavaMailSender emailSender;

    @Autowired
    private Configuration freemarkerConfig;

    @Value("${email-conf.address}")
    private String emailAddress;

    @Value("${email-conf.app-url}")
    private String appUrl;

    public void sendPasswordResetHtmlMessage(Mail mail) throws MessagingException, IOException, TemplateException {
        MimeMessage message = emailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,
                StandardCharsets.UTF_8.name());
        Template t = freemarkerConfig.getTemplate("password-reset-template.ftl");
        String html = FreeMarkerTemplateUtils.processTemplateIntoString(t, mail.getModel());
        helper.setTo(mail.getTo());
        helper.setText(html, true);
        helper.setSubject(mail.getSubject());
        // helper.setFrom(mail.getFrom());
        helper.setFrom(emailAddress, "QCloud");

        emailSender.send(message);
    }

    public boolean sendManualEmail(Mail mail) {
        try {
            Map<String, String> model = new HashMap<>();
            model.put("mailContent", mail.getContent());
            mail.setModel(model);
            MimeMessage message = emailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,
                    StandardCharsets.UTF_8.name());
            Template t = freemarkerConfig.getTemplate("default-mail.ftl");
            String html = FreeMarkerTemplateUtils.processTemplateIntoString(t, mail.getModel());
            helper.setBcc(mail.getTo());
            helper.setSubject(mail.getSubject());
            helper.setText(html, true);
            helper.setFrom(emailAddress, "QSample");
            helper.setReplyTo(emailAddress, "QSample");
            message.setContentLanguage(new String[] { "en" });
            message.setDescription("Informative email");
            emailSender.send(message);
            return true;

        } catch (MessagingException | IOException | TemplateException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Mail createFilePipelineNotifyMail(List<User> users, RequestFile requestFile) {
        Mail mail = new Mail();
        List<String> emails = new ArrayList<>();
        for (User u: users) {
            emails.add(u.getUsername());
        }
        mail.setTo(emails.toArray(new String[0])); // allocate to 0 is faster than array.size()
        mail.setFrom("qcloud@crg.eu"); // https://shipilev.net/blog/2016/arrays-wisdom-ancients/
        mail.setSubject(
                "File " + requestFile.getFilename() + " inserted from request: " + requestFile.getRequestCode());
        mail.setContent("File " + requestFile.getFilename() + " inserted from request: " + requestFile.getRequestCode() + " at " + requestFile.getCreationDate());
        return mail;
    }
}
