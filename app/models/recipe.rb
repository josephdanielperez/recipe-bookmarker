class Recipe < ActiveRecord::Base
  has_many :user_recipes
  has_many :users, through: :user_recipes
  belongs_to :creator, class_name: "User"

  validates_presence_of :name, :url
  validates :name, uniqueness: true
end
