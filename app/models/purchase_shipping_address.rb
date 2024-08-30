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
    # 各テーブルにデータを保存する処理を書く
  end
end
