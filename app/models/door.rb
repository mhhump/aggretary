class Door < ActiveRecord::Base
	belongs_to :project
	belongs_to :user

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  #validates :image, presence: true
  validates :name, presence: true
  validates :project_id, presence: true

	accepts_nested_attributes_for :project, :allow_destroy => true
	accepts_nested_attributes_for :user, :allow_destroy => true


	FRAME_MATERIAL_OPTIONS = {'Aluminum' => :"aluminum", 'Hollow Metal' => :"Hollow Metal", 'Wood' => :wood}
	DOOR_MATERIAL_OPTIONS = {'Aluminum' => 'aluminum', 'Hollow Metal' => 'Hollow Metal', 'Wood' => 'wood'}
	LOCATION_OPTIONS = {'Interior' => 'interior', 'Exterior' => 'exterior'}
	SWING_OPTIONS = {'LH' => 'LH', 'LHR' => 'LHR', 'RH' => 'RH', 'RHR' => 'RHR', 'LHA' => 'LHA', 'LHRA' => 'LHRA', 'RHA' => 'RHA', 'RHRA' => 'RHRA'}
	FIRE_RATING_OPTIONS = {'None' => 'none', '20 min' => '20 min', '45 min' => '45 min', '60 min' => '60 min', '90 min' => '90 min', '3 hr' => '3 hr'}
	LOCK_PREP_OPTIONS = {'None' => 'none', 'Cylindrical' => 'cylindrical', 'Mortise' => 'mortise', 'Rim Exit Device' => 'rim exit device', 'Mortise Exit Device' => 'mortise exit device'}
	DEADBOLT_PREP_OPTIONS = {'None' => 'none', 'Cylindrical' => 'cylindrical', 'Mortise' => 'mortise'}
	LITE_KIT_OPTIONS = {'None' => 'none', 'Narrow Lite' => 'narrow lite', 'Half Lite' => 'half lite', 'Full Lite' => 'full lite'}
	LOUVER_OPTIONS =  {'None' => 'none', 'Louver' => 'louver'}
	MEASURE_FROM_OPTIONS = {'Door' => 'door', 'Frame' => 'frame'}

	 
end