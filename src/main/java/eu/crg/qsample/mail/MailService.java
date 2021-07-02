package eu.crg.qsample.mail;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

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

    @Value("${email-conf.admin-email}")
	private String adminMail;

    @Value("${email-conf.app-url}")
	private String appUrl;

    public void sendPasswordResetHtmlMessage(Mail mail) throws MessagingException, IOException, TemplateException {
        MimeMessage message = emailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,
                StandardCharsets.UTF_8.name());

        // helper.addAttachment("logo.png", new ClassPathResource("images/logo-qcloud.png"));
        // helper.addAttachment("logoCrg.png", new ClassPathResource("images/crgLogo.png"));
        // helper.addAttachment("logoUpf.png", new ClassPathResource("images/upfLogo.png"));

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
            helper.addAttachment("logo.png", new ClassPathResource("images/logo-qcloud.png"));
            helper.addAttachment("logoCrg.png", new ClassPathResource("images/crgLogo.png"));
            helper.addAttachment("logoUpf.png", new ClassPathResource("images/upfLogo.png"));
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
}
