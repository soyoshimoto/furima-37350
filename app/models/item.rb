class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_charges_burden
  belongs_to :shipping_day

  validates :items_name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :price, presence: true, numericality: { less_than_or_equal_to: 9999999, greater_than_or_equal_to: 300}
  validates :shipping_charges_burden_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}

  with_options presence: true do
    validates :price, format: {with: /\A[-]?[0-9]+(\.[0-9]+)?\z/}
  end

  def was_attached?
    self.image.attached?
  end
  
end
