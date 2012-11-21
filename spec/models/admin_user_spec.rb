require 'spec_helper'

describe AdminUser do
  describe "should have the structure" do
    before { @user = AdminUser.new }
    subject { @user }

    it { should respond_to(:email) }
    it { should respond_to(:encrypted_password) }
  end
end
