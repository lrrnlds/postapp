require 'singleton'

class Temp_Database
    include Singleton
    attr_accessor :user_records, :post_records, :current_user

    def initialize
        @user_records = {}
        @post_records = []
        @current_user = nil
    end

end
