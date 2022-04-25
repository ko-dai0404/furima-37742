class OrderPurchase
  include ActiveModel::Model
  attr_accessor :postal, :prefectures_id, :city, :address, :building, :telephone, :user_id, :item_id, :token

  validates :postal,         presence: true
  validates :prefectures_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city,           presence: true
  validates :address,        presence: true
  validates :telephone,      presence: true

  POSTAL_REGEX = /\A\d{3}[-]\d{4}\z/
  validates_format_of :postal, with: POSTAL_REGEX

  TELEPHONE_REGEX = /\A\d{10,11}\z/
  validates_format_of :telephone, with: TELEPHONE_REGEX


  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Order.create(postal: postal, prefectures_id: prefectures_id, city: city, address: address, building: building, telephone: telephone, purchase_record_id: purchase_record.id)
  end
end