import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

msg = MIMEMultipart()
msg['From'] = 'dev@paine.nyc'
msg['To'] = 't.paine154@gmail.com'
msg['Subject'] = 'simple email in python'
message = 'here is the email'
msg.attach(MIMEText(message))

mailserver = smtplib.SMTP('smtppro.zoho.com',587)
# identify ourselves to smtp gmail client
mailserver.ehlo()
# secure our email with tls encryption
mailserver.starttls()
# re-identify ourselves as an encrypted connection
mailserver.ehlo()
mailserver.login('dev@paine.nyc', '6c1cWc5qH2Uj')

mailserver.sendmail('dev@paine.nyc','t.paine154@gmail.com',msg.as_string())

mailserver.quit()
