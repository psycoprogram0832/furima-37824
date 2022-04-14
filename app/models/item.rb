class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :condition
  belongs_to :category
  belongs_to :shipment
  belongs_to :delivery_charge
  has_many_attached :images


  validates :product_name, presence: true
  validates :introduction, presence: true
  validates :image, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
end
