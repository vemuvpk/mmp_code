using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace MMCDating.Common
{
    public class Utility
    {
        public static bool SendMail(string EmailTo, string EmailFrom, string EmailCC, string EmailBCC, string EmailSubj, string EmailBody)
        {
            try
            {
                MailMessage objMailMsg = new MailMessage(EmailFrom, EmailTo);

                //
                if (EmailCC != "")
                {
                    objMailMsg.CC.Add(EmailCC);

                }
                if (EmailBCC != "")
                {
                    objMailMsg.Bcc.Add(EmailBCC);
                }

                //, List<string> attachmentpath
                //foreach (var item in attachmentpath)
                //{
                //    objMailMsg.Attachments.Add(new Attachment(item));
                //}

                objMailMsg.From = new MailAddress(EmailFrom);
                objMailMsg.Sender = new MailAddress(EmailFrom);
                objMailMsg.Subject = EmailSubj;
                objMailMsg.Body = EmailBody;
                objMailMsg.Priority = MailPriority.Normal;
                objMailMsg.IsBodyHtml = true;
                SmtpClient objSMTPClient = new SmtpClient();
                objSMTPClient.Timeout = int.MaxValue;
                objSMTPClient.EnableSsl = true; // Remove comment of this when uploading on live , and it should be commentd for local
                objSMTPClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                objSMTPClient.Send(objMailMsg);
                return true;
            }
            catch (SmtpException ex)
            {
                return false;
            }
        }
    }
}