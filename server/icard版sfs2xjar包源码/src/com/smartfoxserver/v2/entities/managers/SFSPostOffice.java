/*     */ package com.smartfoxserver.v2.entities.managers;
/*     */ 
/*     */ import com.smartfoxserver.v2.config.ServerSettings.MailerSettings;
/*     */ import com.smartfoxserver.v2.entities.Email;
/*     */ import java.util.ArrayList;
/*     */ import java.util.Date;
/*     */ import java.util.List;
/*     */ import java.util.Properties;
/*     */ import java.util.concurrent.ScheduledExecutorService;
/*     */ import java.util.concurrent.ScheduledThreadPoolExecutor;
/*     */ import java.util.concurrent.TimeUnit;
/*     */ import javax.mail.Address;
/*     */ import javax.mail.Authenticator;
/*     */ import javax.mail.Message.RecipientType;
/*     */ import javax.mail.MessagingException;
/*     */ import javax.mail.PasswordAuthentication;
/*     */ import javax.mail.Session;
/*     */ import javax.mail.Transport;
/*     */ import javax.mail.internet.InternetAddress;
/*     */ import javax.mail.internet.MimeMessage;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public class SFSPostOffice
/*     */   implements IMailerService
/*     */ {
/*     */   private static final String MAIL_PROTOCOL = "smtp";
/*     */   private static final String ADDRESS_SEPARATOR = ",";
/*     */   private ServerSettings.MailerSettings config;
/*     */   private ScheduledExecutorService executor;
/*     */   private final Logger logger;
/*     */   private Session session;
/*     */ 
/*     */   public SFSPostOffice()
/*     */   {
/* 123 */     this.logger = LoggerFactory.getLogger(getClass());
/*     */   }
/*     */ 
/*     */   public void init(Object o)
/*     */   {
/* 129 */     if ((o == null) || (!(o instanceof ServerSettings.MailerSettings))) {
/* 130 */       throw new IllegalArgumentException("Invalid MailerServer configuration.");
/*     */     }
/* 132 */     this.logger.info("PostOffice service started");
/*     */ 
/* 134 */     this.config = ((ServerSettings.MailerSettings)o);
/*     */ 
/* 136 */     Properties props = new Properties();
/*     */ 
/* 139 */     props.setProperty("mail.transport.protocol", "smtp");
/* 140 */     props.setProperty("mail.host", this.config.mailHost);
/* 141 */     props.setProperty("mail.user", this.config.mailUser);
/* 142 */     props.setProperty("mail.password", this.config.mailPass);
/* 143 */     props.setProperty("mail.smtp.port", String.valueOf(this.config.smtpPort));
/* 144 */     props.setProperty("mail.smtp.auth", "true");
/* 145 */     props.setProperty("mail.smtp.starttls.enable", "true");
/*     */ 
/* 148 */     Authenticator passAuth = null;
/*     */ 
/* 150 */     if (this.config.smtpPort == 465)
/*     */     {
/* 152 */       props.put("mail.smtp.socketFactory.port", "465");
/* 153 */       props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
/*     */ 
/* 155 */       passAuth = new Authenticator()
/*     */       {
/*     */         protected PasswordAuthentication getPasswordAuthentication()
/*     */         {
/* 159 */           return new PasswordAuthentication(SFSPostOffice.this.config.mailUser, SFSPostOffice.this.config.mailPass);
/*     */         }
/*     */       };
/*     */     }
/* 164 */     this.session = Session.getDefaultInstance(props, passAuth);
/*     */ 
/* 167 */     this.executor = new ScheduledThreadPoolExecutor(this.config.workerThreads);
/*     */   }
/*     */ 
/*     */   public void destroy(Object o)
/*     */   {
/* 173 */     this.executor.shutdownNow();
/*     */   }
/*     */ 
/*     */   public String getName()
/*     */   {
/* 179 */     return "SFSPostOffice";
/*     */   }
/*     */ 
/*     */   public ServerSettings.MailerSettings getConfiguration()
/*     */   {
/* 188 */     return this.config;
/*     */   }
/*     */ 
/*     */   public void sendMail(Email email, IMailerCallbackHandler callBack)
/*     */     throws MessagingException
/*     */   {
/* 197 */     sendMail(email, callBack, 0);
/*     */   }
/*     */ 
/*     */   public void sendMail(Email email)
/*     */     throws MessagingException
/*     */   {
/* 206 */     sendMail(email, null, 0);
/*     */   }
/*     */ 
/*     */   public void sendMail(Email email, IMailerCallbackHandler callBack, int delaySeconds)
/*     */     throws MessagingException
/*     */   {
/* 216 */     MimeMessage message = new MimeMessage(this.session);
/*     */ 
/* 219 */     message.setContent(email.getMessage(), "text/html");
/*     */ 
/* 222 */     if (email.getPriority() > 0) {
/* 223 */       message.setHeader("X-Priority", String.valueOf(email.getPriority()));
/*     */     }
/*     */ 
/* 226 */     message.setSubject(email.getSubject());
/*     */ 
/* 229 */     Address fromAddress = new InternetAddress(email.getFromAddress());
/*     */ 
/* 232 */     List recipients = new ArrayList();
/*     */     String item;
/* 234 */     if (email.getToAddress().indexOf(",") != -1)
/*     */     {
/* 236 */       String[] toAddresses = email.getToAddress().split("\\,");
/*     */ 
/* 238 */       for (item : toAddresses)
/* 239 */         recipients.add(new InternetAddress(item));
/*     */     }
/*     */     else
/*     */     {
/* 243 */       recipients.add(new InternetAddress(email.getToAddress()));
/*     */     }
/*     */ 
/* 247 */     message.setSentDate(new Date());
/* 248 */     message.setFrom(fromAddress);
/*     */ 
/* 250 */     for (Address addr : recipients) {
/* 251 */       message.addRecipient(Message.RecipientType.TO, addr);
/*     */     }
/*     */ 
/* 254 */     this.executor.schedule(new MailDelivery(message, email, callBack), delaySeconds, TimeUnit.SECONDS);
/*     */   }
/*     */ 
/*     */   public void handleMessage(Object message)
/*     */   {
/* 261 */     throw new UnsupportedOperationException("Not supported by this service!");
/*     */   }
/*     */ 
/*     */   public void setName(String name)
/*     */   {
/* 268 */     throw new UnsupportedOperationException("Not supported by this service!");
/*     */   }
/*     */ 
/*     */   private final class MailDelivery
/*     */     implements Runnable
/*     */   {
/*     */     final Email email;
/*     */     final IMailerCallbackHandler handler;
/*     */     final MimeMessage message;
/*     */ 
/*     */     public MailDelivery(MimeMessage message, Email email, IMailerCallbackHandler handler)
/*     */     {
/*  82 */       this.email = email;
/*  83 */       this.handler = handler;
/*  84 */       this.message = message;
/*     */     }
/*     */ 
/*     */     public void run()
/*     */     {
/*     */       try
/*     */       {
/*  92 */         Transport smtp = SFSPostOffice.this.session.getTransport("smtp");
/*  93 */         smtp.connect(SFSPostOffice.this.config.mailHost, SFSPostOffice.this.config.smtpPort, SFSPostOffice.this.config.mailUser, SFSPostOffice.this.config.mailPass);
/*     */ 
/*  96 */         smtp.sendMessage(this.message, this.message.getAllRecipients());
/*  97 */         smtp.close();
/*     */ 
/* 100 */         this.handler.onSuccess(this.email);
/*     */       }
/*     */       catch (Exception e)
/*     */       {
/* 105 */         this.handler.onError(this.email, e);
/* 106 */         SFSPostOffice.this.logger.warn(String.format("Failed sending email: %s, %s", new Object[] { this.email, e }));
/*     */       }
/*     */     }
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.managers.SFSPostOffice
 * JD-Core Version:    0.6.0
 */