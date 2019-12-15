require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase

  # Tests the contact email action
  test "should return contact email" do
    mail = ContactMailer.contact_email("jonathan@me.com", "Jonathan Clarke", "0192837465", @message = "Hello, \n this is my message.")
    assert_equal ['to@example.com'], mail.to
    assert_equal ['from@example.com'], mail.from
  end
end
