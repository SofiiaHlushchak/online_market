class Product < ApplicationRecord
  validates :price, numericality: {greater_than: 0, allow_nill: true}
  validates :name, presence: true

  has_many :positions
  has_many :carts, through: :positions
  has_many :comments, as: :commentable
  has_one  :image, as: :imageable
  after_initialize {p "initialize"} #Product.new  Product.first
  after_save       {p "save"} #Product.save Product.create
  after_create     {p "create"}
  after_update     {p "update"}
  after_destroy    {p "destroy"}
end
