# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :password_digest, :password, :password_confirmation
  has_secure_password

  EMAIL_REGEX = /\A\S+@\S+\.\S+\z/
  validates :email, presence: true, format: EMAIL_REGEX,
    uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 5 }
  validates :password_confirmation, presence: true

  before_save do |user|
    # Standardize email address casing. Can affect indexes in certain databases.
    user.email = user.email.downcase
  end
end
