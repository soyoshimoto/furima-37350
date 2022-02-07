class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :items_name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :price, presence: true
  validates :shipping_charges_burden_id, presence: true
  validates :prefecture_id, presence: true

end
