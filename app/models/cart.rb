class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many   :positions
  has_many   :products, through: :position
end
