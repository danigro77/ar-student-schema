require_relative '../../db/config'
require 'date'
require 'sqlite3'


# implement your Student model here
class Student <  ActiveRecord::Base
  attr_accessible :first_name, :last_name, :gender, :birthday, :email, :phone
  
  validate :email_format, :phone_number_length, :too_young
  validates :email, :uniqueness => true
  
  def name
    "#{first_name} #{last_name}"
  end
  
  def age(reference_date = Date.today)
    reference_date.year - birthday.year
  end
  
  def too_young
    errors.add(:birthday, "Invalid birthday. Student is too young.") unless (age > 5)
  end
  
  def email_format
    errors.add(:email, "Invalid email address. Too less ot to many @ in the email.") if (email.count("@") != 1)
    errors.add(:email, "Invalid email address. There need to be dots in a valid email address.") if (email.count(".") < 1)
    errors.add(:email, "Invalid email address.") unless (email =~ /^(.+)(@)(.+)(\.)(..+)$/)
  end
 
  def phone_number_length
    errors.add(:phone, "Invalid phone number. Number too short.") if (phone.gsub(/\D/,"").length < 10)
  end
  
end