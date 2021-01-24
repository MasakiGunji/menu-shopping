class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :recipes
  has_many :purchas_recipes
  has_many :purchas_foods
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
