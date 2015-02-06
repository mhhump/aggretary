class Project < ActiveRecord::Base
	belongs_to :user
	has_many :doors

	validates :name, presence: true
	
end
