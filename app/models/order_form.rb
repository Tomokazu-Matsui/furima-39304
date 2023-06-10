class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id,:order_id,:postal_code, :item_prefecture_id, :city, :addresses, :building, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :item_prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :user_id
    validates :item_id
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A[0-9]{11}\z/,message: 'Please enter a half-width numerical value of 10 to 11 digits'}
  end
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Order.create
  end
end
