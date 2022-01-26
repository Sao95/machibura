class ContactMailer < ApplicationMailer

  def send_mail(contact)
    @contact = contact
    mail to: ENV['MAIL_ADDRESS'], subject: 'お問い合わせ内容'
  end
  
end
