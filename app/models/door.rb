class Door < ActiveRecord::Base
	belongs_to :project
	belongs_to :user

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  #validates :image, presence: true
  validates :name, presence: true

	accepts_nested_attributes_for :project, :allow_destroy => true
	accepts_nested_attributes_for :user, :allow_destroy => true

	 
end
