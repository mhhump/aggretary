class Opening < ActiveRecord::Base
	belongs_to :project
	belongs_to :user
	has_many :doors, dependent: :destroy

  validates :number, presence: true
  validates :project_id, presence: true

	accepts_nested_attributes_for :project, :allow_destroy => true
	accepts_nested_attributes_for :user, :allow_destroy => true
	accepts_nested_attributes_for :doors, :allow_destroy => true

	LOCATION_OPTIONS = {'Interior' => 'interior', 'Exterior' => 'exterior'}
	SWING_OPTIONS = {'LH' => 'LH', 'LHR' => 'LHR', 'RH' => 'RH', 'RHR' => 'RHR', 'LHA' => 'LHA', 'LHRA' => 'LHRA', 'RHA' => 'RHA', 'RHRA' => 'RHRA'}
	FIRE_RATING_OPTIONS = {'None' => 'none', '20 min' => '20 min', '45 min' => '45 min', '60 min' => '60 min', '90 min' => '90 min', '3 hr' => '3 hr'}
end
