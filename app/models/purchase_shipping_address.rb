class PurchaseShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number

  with_options presence: true do
    validates :user_id, :item_id, :city, :address
    validates :postal_code,  format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input half-width numbers' }
  end
  validates :shipping_area, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code:, shipping_area:, city:, address:, building_name:, phone_number:, purchase_id: purchase.id)
  end
end
