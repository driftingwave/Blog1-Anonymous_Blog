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

  @post = Post.create(title: params[:title], body: params[:body])

  tags_original = params[:tag].split(", ")
  tags_copy = tags_original.dup

  while tags_copy.length > 0
    tag_name = tags_copy.pop.downcase
    if Tag.find_by_name(tag_name)
      tag = Tag.find_by_name(tag_name)

    else
      tag = Tag.create(name: tag_name)
    end
    PostTag.create(post_id: @post.id, tag_id: tag.id)
  end
  
  @tags = @post.find_related_tags
  erb :display_post
end

get '/posts/display' do
  @post = Post.find(params[:id])
  @tags = @post.find_related_tags
  erb :display_post
end

get '/posts/search_to_display' do
  @all = Post.all 
  erb :post_search_to_display
end

post '/posts/search_to_display' do
  @post = Post.find_by_title(params[:title])
end

get '/posts/update' do

end