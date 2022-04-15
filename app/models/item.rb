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
  validates :category_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :shipment_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 0, message: "can't be blank" }
  with_options presence: true, format: { with:/\A[0-9]+\z/ } do
    validates :price,numericality: {only_integer: true, greater_than_or_equal_to:300, less_than_or_equal_to:9_999_999},presence: { message:"cant be blank" }
  end
end
