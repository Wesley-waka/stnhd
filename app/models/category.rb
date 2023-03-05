class Category < ActiveRecord::Base
    has_many :furnitures
    has_many :companies, through: :furnitures
  end