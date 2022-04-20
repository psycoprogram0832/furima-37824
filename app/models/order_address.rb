class OrderAddress
  include ActiveModel::Model
  attr_accessor :address, :building, :post_code, :city, :phone_number, :prefecture_id, :purchase, :item_id, :user_id, :image

  
  with_options presence: true do
    validates :building
    validates :city
    validates :item_id
    validates :
    validates :
    validates :phone_number
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
    # binding.pry
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end
