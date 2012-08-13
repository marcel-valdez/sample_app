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
  validates_format_of :name, with: /\A[a-zA-Z]+[a-zA-Z\. ]*\Z/
  validates :email, presence: true,
            format: {with: EMAIL_FORMAT_REGX},
            uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 6}
  validates :password_confirmation, presence: true


  # @return [String] The email formatted like: Real Name <person@email.com>
  def formatted_email
    return "#{self.name} <#{self.email}>"
  end

  before_save { |user| user.email.downcase! }
  before_save :create_remember_token

  private
  def create_remember_token
    # Create the token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
