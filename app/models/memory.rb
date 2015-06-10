class Memory < ActiveRecord::Base
	self.per_page = 5
	default_scope { order("created_at DESC") }

	validates :post, presence: true
	validates :name, presence: true
	validates :relationship, presence: true

	
	mount_uploader :image, ImageUploader
end
