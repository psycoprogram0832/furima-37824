class OrderAddress
  include ActiveModel::Model
  attr_accessor :address, :building, :post_code, :city, :phone_number, :prefecture_id, :purchase, :item_id, :user_id, :token

  
  with_options presence: true do
    validates :token
    validates :city
    validates :item_id
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/}
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  end
  

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end
