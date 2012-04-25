# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe User do

  before do
    @user = User.new email: 'test.user@gmail.com',
      password: 'kraplox', password_confirmation: 'kraplox'
    # @user.save
  end

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  # "#{User.all.count.should}" == "1"

  describe "with absolutely empty email" do
    before { @user = User.new email: '' }
    subject { @user }

    it { should_not be_valid }
  end

  describe "with only whitespace email" do
    before { @user = User.new email: '    ' }
    subject { @user }

    it { should_not be_valid }
  end

  describe "with bad email" do
    before { @user = User.new email: 'butt@fart' }
    subject { @user }

    it { should_not be_valid }
  end

  describe "with email that includes spaces" do
    before { @user = User.new email: 'test user@gmail.com' }
    subject { @user }

    it { should_not be_valid }
  end

  describe "with dupe email" do
    before do
      dupe = @user.dup
      dupe.save
    end

    # dupe was saved, so @user shouldn't be able to.
    it { should_not be_valid }
  end

  describe "with dupe email that has different casing" do
    before do
      dupe = @user.dup
      dupe.email = dupe.email.upcase
      dupe.save
    end

    it { should_not be_valid }
  end

  describe "with no password" do
    before { @user.password = @user.password_confirmation = '' }
    it { should_not be_valid }
  end

  describe "with nil password confirmation" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "return value of authenticate" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("fart") }

      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end

  describe "with password that's too short" do
    let(:user_with_short_pw) do
      User.new email: 'another@gmail.com',
        password: 'frax', password_confirmation: 'frax'
    end

    specify { user_with_short_pw.should be_invalid }
  end

end
