require 'spec_helper'

describe "User database" do
  before { @user = User.new(name: "Mr Sample", email: "mrsample@mail.com", password: "foobar", password_confirmation: "foobar") }
  subject { @user }
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = "" }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "a"*51 }
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @user = User.new(name: "Mr Sample", email: "mrsample@mail.com", password: "", password_confirmation: "") }
    it { should_not be_valid }
  end

  describe "when passwords do not match" do
    before { @user.password_confirmation = "fooba" } 
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = "" }
    it { should_not be_valid }
  end

  describe "when email is valid" do
    it "should be a valid mail id" do
      addresses = ["jerry@mymail.com", "jerry_splat@mymail.in", "jerry.splat@mymail.co.uk", "JeRrY-92@mymail.com"]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

  describe "when email is invalid" do
    it "should be an invalid email id" do
      addresses = ["jer,ry@mymailcom", "jerry@splat@mymail.in", "jerry.splat@my+mail.co.uk", "JeRrY-92@mym_ail.com"]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email address is already used" do
    before do
      user_dupli = @user.dup
      user_dupli.email = @user.email.upcase
      user_dupli.save
    end
    it { should_not be_valid }
  end

end
