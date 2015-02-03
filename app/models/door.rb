class Door < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  #validates :image, presence: true
  validates :name, presence: true

	measure_from = [['Door', 1], ['Frame', 2]] 
	frame_material = [['Aluminum', 1], ['Hollow Metal', 2], ['Wood', 3]]

	 
end
