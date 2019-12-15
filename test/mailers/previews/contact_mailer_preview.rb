# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  # Displays the preview of the email
  def contact_email
    ContactMailer.contact_email("jonathan@me.com", "Jonathan Clarke", "0192837465", @message = "Hello, \n this is my message.")
  end
end
