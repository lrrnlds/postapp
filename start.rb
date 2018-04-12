require_relative 'application'
require 'sqlite3'
require 'active_record'


ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: ':memory:'
)

ActiveRecord::Schema.define do
  create_table :users, force: true do |t|
    t.string :email
    t.string :token
  end

  create_table :posts, force: true do |t|
    t.string :body
    t.belongs_to :users, index: true
  end
end

app = Application.new

user_status = gets.chomp.downcase

if user_status == 'sign_up'
  puts 'Enter email'
  app.sign_up(gets.chomp.downcase)
  puts "ok"
end
