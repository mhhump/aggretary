class Project < ActiveRecord::Base
	has_many :doors, dependent: :destroy
	belongs_to :user

	validates :name, presence: true

	accepts_nested_attributes_for :doors, :allow_destroy => true

	
end
