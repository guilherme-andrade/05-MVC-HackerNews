class PostsView
  # TODO: implement methods called by the PostsController
  def display_list(posts)
    puts "Here is a list of all posts:"
  	posts.each { |post| display(post) }
  end

  def ask_user_for(something)
  	puts "#{something.capitalize}?"
  	gets.chomp
  end

  def display(post)
  	puts %(#{post.id} -> title: #{post.title} | url: #{post.url} | votes: #{post.votes})
  end
end
