class Post < ActiveRecord::Base
  validates_presence_of :title, :body
  has_and_belongs_to_many :tags

  def find_related_tags
    related_tags = []
    post_tag_pairs = PostTag.find_all_by_post_id(self.id)
    post_tag_pairs.each do |pair|
      related_tags << Tag.find(pair.tag_id).name
    end
    related_tags.join(", ")
  end
end
