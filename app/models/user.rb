# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password

  EMAIL_FORMAT_REGX = /\A[\w\+\-\.]+@[a-z\d\-\.]+\.[a-z]+\z/i

  validates :name, presence: true,
            length: {maximum: 50}
  validates :email, presence: true,
            format: {with: EMAIL_FORMAT_REGX},
            uniqueness: {case_sensitive: false}
  validates :password, presence: true,
            length: {minimum: 6}
  validates :password_confirmation, presence: true


  # @return [String] The email formatted like: Real Name <person@email.com>
  def formatted_email
    return "#{self.name} <#{self.email}>"
  end

  before_save do |user|
    user.email = email.downcase
  end
end
