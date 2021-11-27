package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
 

public class GoogleAuthentication extends Authenticator {
	
	PasswordAuthentication passAuth;
    
    public GoogleAuthentication(){
        passAuth = new PasswordAuthentication("emailtestit09@gmail.com", "afyeghddwtdsqroj");
    }
 
    public PasswordAuthentication getPasswordAuthentication() {
        return passAuth;
    } 
}
