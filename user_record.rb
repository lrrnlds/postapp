require_relative 'temp_database'
require 'SecureRandom'

class User_Record

  attr_reader :email, :access_token

  @@database = Temp_Database.instance

  def initialize(id, email, access_token)
    @email = email
    @access_token = access_token
    @id = id
  end

  def self.create(email)
    access_token = SecureRandom.hex(2)

    if @@database.user_records.empty?
     id = 1
    else
     id = @@database.user_records.last.id + 1
   end

   user = User_Record.new(id, email, access_token)
   @@database.user_records[email] = user

   print "emai? #{user.email} \n"
   print "Here is your token:  #{access_token} \n"

   sign_in(user.email, user.access_token)
   return access_token
  end

  def self.sign_in(email, access_token)
    user = @@database.user_records[email]

    if user && access_token === user.access_token
      @@database.current_user = user
    end
  end

end
