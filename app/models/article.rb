class Article < ActiveRecord::Base
	has_many :comments
	has_many :taggings
	has_many :taggings
	has_many :tags, through: :taggings

	has_attached_file :image
	validates_attachment_content_type :image, content_type:["image/png","image/jpg","image/jpeg"]
	
	validates :title, 	presence:true,
						length:{minimum:3}
						
	validates :body, 	presence:true, 
						length:{minimum:15}




	def tag_list=(tags_string)
		tag_names = tags_string.split(",").collect { |t| t.strip.downcase }.uniq
		self.tags = tag_names.collect{ |name| Tag.find_or_create_by(name: name ) }
	end

	def tag_list
		self.tags.join(", ")
	end
end

