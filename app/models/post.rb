class Post
  # TODO: Gather all code from all previous exercises
  # - reader and accessors
  attr_accessor :title, :url
  attr_reader :id, :votes

  # - initialize
  def initialize(attributes = {})
    @id = attributes[:id]
    @votes = attributes[:votes] || 0
    @url = attributes[:url]
    @title = attributes[:title]
  end


  # - self.find
  def self.find(id)
  	DB.results_as_hash = true

  	result = DB.execute('SELECT * FROM posts WHERE id = ?', id).first
  	new(result.transform_keys(&:to_sym))
  end


  # - self.all
  def self.all
  	DB.results_as_hash = true

  	DB.execute('SELECT * FROM posts').map { |post| new(post.transform_keys(&:to_sym)) }
  end


  # - save
  def save
  	DB.results_as_hash = true

  	if id
  		DB.execute('UPDATE posts SET url = ?, title = ?, votes = ? WHERE id = ?', url, title, votes, id)
  	else
  		DB.execute('INSERT INTO posts (url, title, votes) VALUES (?, ?, ?)', url, title, votes)
  		@id ||= DB.last_insert_row_id
  	end
  end

   # self.create
  def self.create(attributes = {})
  	post = new(attributes)
		post.save
  end


  def update(attributes = {})
    @title = attributes[:title]
    @url = attributes[:url]
  	save
  end


  # - destroy
  def destroy
  	DB.results_as_hash = true
  	
  	DB.execute('DELETE FROM posts WHERE id = ?', id)
  end


  # - upvote
  def upvote
  	@votes += 1
  	save
  end
end