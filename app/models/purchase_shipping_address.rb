class PurchaseShippingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :user_id, :item_id
end
