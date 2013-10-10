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

get '/posts/display_one' do
  @post = Post.find_by_title(params[:title])
  erb :display_one_post
end
