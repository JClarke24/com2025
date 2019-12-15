class ApplicationMailer < ActionMailer::Base
  # Sets up mailer for the application

  default to: 'to@example.com', from: 'from@example.com'
  layout 'mailer'
end
