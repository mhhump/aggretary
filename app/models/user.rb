class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects
  has_many :openings, through: :projects
  has_many :doors, through: :openings
  has_many :pins
  has_many :products
  

  accepts_nested_attributes_for :doors, :allow_destroy => true
  accepts_nested_attributes_for :projects, :allow_destroy => true
  accepts_nested_attributes_for :openings, :allow_destroy => true

  validates :name, presence: true
end