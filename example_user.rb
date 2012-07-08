# This file was created as part of the Chapter 4 learning, probably will be deleted later on.
# Deletable
class User
  attr_accessor :name, :email

  # @param [Hash] attributes of the User: {:name, :email}
  def initialize(attributes = {})
    @name = attributes[:name]
    @email = attributes[:email]
  end

  # @return [String] The email formatted like: Person Name <person@email.com>
  def formatted_email
    return "#{@name} <#{@email}>"
  end
end