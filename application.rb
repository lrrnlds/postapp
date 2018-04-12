require_relative 'user_record'
require_relative 'post_record'
require_relative 'temp_database'

class Application

  @@database = Temp_Database.instance

  def initialize
    current_user = nil
    puts "Welcome; type help for options"
  end

  def prompt

    if @@database.current_user === nil
      print "> "
    else
      print "#{@@database.current_user.email} > "
    end

    command_arguments = gets.chomp.split(' ')
    case command_arguments.first
    when 'sign_up'
        User_Record.create(command_arguments[1])
    when 'sign_in'
        User_Record.sign_in(command_arguments[1], command_arguments[2])
    when 'list_posts'
        posts = Post_Record.list_posts
        posts.each_with_index { |post, i| puts "#{i + 1}. #{post.text}"}
    when 'create_post'
        post = Post_Record.create(command_arguments[1..-1].join(' '))
    when 'exit'
      exit
    when 'help'
        puts "Available commands:"
        if @@database.current_user
            puts "create_post <text>"
            puts "list_posts"
            puts "exit"
        else
            puts 'sign_in email_here access_token_here'
            puts 'sign_up email_here'
            puts 'exit'
        end
    else
        puts "*shrug*"
    end
    prompt
  end

end

app = Application.new
app.prompt
