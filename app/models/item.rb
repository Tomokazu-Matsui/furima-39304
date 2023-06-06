class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  has_one :order
  has_one_attached :image
  
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_info
    validates :item_category_id
    validates :item_sales_status_id
    validates :item_shipping_fee_status_id
    validates :item_prefecture_id
    validates :item_scheduled_delivery_id
  end
  with_options numericality: { other_than: 0 } do
    validates :item_category_id
    validates :item_prefecture_id
    validates :item_sales_status_id
    validates :item_shipping_fee_status_id
    validates :item_prefecture_id
    validates :item_scheduled_delivery_id
    with_options format: { with: /\A[0-9]+\z/ } do
      validates :item_price, numericality: { greater_than: 300, less_than: 9999999 } 
    end
  end
end