#!/usr/bin/env python3
# script to send monthly email through gmail
# chatgpt created most of this because I was lazy

import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
import datetime
import subprocess

# Set up the SMTP server and login details
smtp_server = 'smtp.gmail.com'  # Replace with your SMTP server
smtp_port = 587  # Use appropriate port (usually 587 or 465)
sender_email = 'SENDER@whatever.com'  # Replace with your email
sender_password = 'create-this-in-google-settings'  # Replace with your email password or app-specific password                                                                                                                       
current_month = datetime.datetime.now().strftime("%B")  # Returns full month name (e.g., January)
try:
    fortune_output = subprocess.check_output(["fortune"], text=True).strip()                                                                    
except FileNotFoundError:
    fortune_output = "Fortune program is not installed. Please install it to include quotes."


# Set up the subject and body
subject = f"This is the month {current_month}"
body = f"""
This is the message body and this is a quote:

{fortune_output}
"""

# Create the email message
message = MIMEMultipart()
# message['From'] = sender_email                                        
message['From'] = 'Sender Name Here'
message['To'] = 'RECIPIENT@whatever.com'  # Replace with the recipient's email address
message['Subject'] = subject

# Attach the body to the email
message.attach(MIMEText(body, 'plain'))

# Send the email
try:
    server = smtplib.SMTP(smtp_server, smtp_port)
    server.starttls()  # Secure the connection
    server.login(sender_email, sender_password)
    server.sendmail(sender_email, 'RECIPIENT@whatever.com',
                message.as_string())  # Send to recipient
    print(f"Email sent successfully with subject: {subject}")
except Exception as e:
    print(f"Failed to send email: {e}")
finally:
    server.quit()
