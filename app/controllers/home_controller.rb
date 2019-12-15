class HomeController < ApplicationController

  # GET /home
  def home

  end

  # GET /contact
  def contact

  end

  # Checking if contact form is filled, using mailer to deliver email.
  def request_contact
    name = params[:name]
    email = params[:email]
    telephone = params[:telephone]
    message = params[:message]

    if email.blank?
      flash[:alert] = I18n.t('home.request_contact.no_email')
      redirect_to contact_path
    else
      ContactMailer.contact_email(email, name, telephone, message).deliver_now
      flash[:notice] = I18n.t('home.request_contact.email_sent')
      redirect_to root_path
    end
  end

end
