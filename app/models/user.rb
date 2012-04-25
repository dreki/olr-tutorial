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
  attr_accessible :email

  EMAIL_REGEX = /\A\S+@\S+\.\S+\z/
  validates :email, presence: true, format: EMAIL_REGEX,
    uniqueness: { case_sensitive: false }

  before_save do |user|
    # Standardize email address casing. Can affect indexes in certain databases.
    user.email = user.email.downcase
  end
end
