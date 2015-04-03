class Project < ActiveRecord::Base
	has_many :openings, dependent: :destroy
	has_many :doors, through: :openings
	belongs_to :user

	validates :name, presence: true

	accepts_nested_attributes_for :doors, :allow_destroy => true
	accepts_nested_attributes_for :openings, :allow_destroy => true
	accepts_nested_attributes_for :user
	
end
