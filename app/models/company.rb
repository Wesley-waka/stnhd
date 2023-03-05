class Company < ActiveRecord::Base
    has_many :furnitures
    has_many :categories, through: :furnitures
  end