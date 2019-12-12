require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not saved invalid user' do
    user = User.new
    user.save
    refute user.valid?
  end

  test 'should save valid user' do
    user = User.new
    user.email = 'myemail@bmail.com'
    user.password = 'mypassword123'
    user.save
    assert user.valid?
  end
end
