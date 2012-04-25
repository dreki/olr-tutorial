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
    @user = User.new email: 'test.user@gmail.com'
    # @user.save
  end

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }

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

end
