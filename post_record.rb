require_relative 'temp_database'

class Post_Record

  attr_reader :user
  attr_accessor :text, :id

  @@database = Temp_Database.instance

  def initialize(id, text, user, created_at)
    @id = id
    @text = text
    @user = user
    @created_at = created_at
  end

  def self.create(text)
    if @@database.post_records.empty?
     id = 1
    else
     id = @@database.post_records.last.id + 1
   end

   post = Post_Record.new(id, text, @@database.current_user, Time.now)
   @@database.post_records.push(post)
  end

  def self.list_posts
    @@database.post_records.reverse
  end

end
