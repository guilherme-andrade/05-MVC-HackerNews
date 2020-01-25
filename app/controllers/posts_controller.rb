class PostsController
  def initialize
    @view = PostsView.new
  end

  ################################################################
  # BEWARE: you MUST NOT use the global variable DB in this file #
  ################################################################

  def index
    # TODO: implement listing all posts
    @posts = Post.all
    @view.display_list(@posts)
  end

  def create
    # TODO: implement creating a new post
    get_url_and_title

    Post.create(title: @title, url: @url)
  end

  def update
    # TODO: implement updating an existing post
    index
    get_post

    @view.display(@post)

    get_url_and_title

    @post.update(title: @title, url: @url)
  end

  def destroy
    # TODO: implement destroying a post
    index
    get_post

    @post.destroy
  end

  def upvote
    # TODO: implement upvoting a post
    index
    get_post

    @post.upvote
  end

  def get_url_and_title
    @title = @view.ask_user_for(:title)
    @url = @view.ask_user_for(:url)
  end

  def get_post
    @id = @view.ask_user_for(:id).to_i
    @post = Post.find(@id)
  end
end
