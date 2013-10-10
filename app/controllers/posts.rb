=begin

All Post-related routes

Operations:
  display all posts
  display one post
  create new post, including tags
  edit post
  delete post

=end

get '/posts' do
  erb :index
end

get '/posts/create' do
  erb :create_post
end

post '/posts/create' do

  tags = params[:tag].split(", ")
  copy = tags.dup
  until copy.length == 0
    Tag.create(name: copy.pop)
  end

  tags.each do |tag|
    source = Tag.find_by_name(tag)
    source.id
  end
  post = Post.create(title: params[:title], body: params[:body])
  erb :index
end

get '/posts/display_one' do
  @post = Post.find_by_title(params[:title])
  erb :display_one_post
end
