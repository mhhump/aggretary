class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :doors
  has_many :pins
  has_many :products

  accepts_nested_attributes_for :doors, :allow_destroy => true

  validates :name, presence: true
end