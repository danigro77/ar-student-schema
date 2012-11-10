require_relative '../../db/config'
require 'date'

# implement your Student model here
class Student <  ActiveRecord::Base
  
  attr_reader :first_name, :last_name, :gender, :birthday, :email, :phone
  
  def assign_attributes(options = {})
     @first_name = options[:first_name]
     @last_name = options[:last_name]
     @gender = options[:gender]
     @birthday = options[:birthday]
     # options[:name] = name
     # @email = options[:email]
     # @phone = options[:phone]
  end
  
  def name
    "#{first_name} #{last_name}"
  end
  
  def age
    date = Date.today 
    date.year - birthday.year
  end
  
end
