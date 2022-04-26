class Item < ApplicationRecord
  validates :image,          presence: true
  validates :product,        presence: true, length: { maximum: 40 }
  validates :description,    presence: true, length: { maximum: 1000 }
  validates :category_id,    numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :burden_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :prefectures_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_id,    numericality: { other_than: 1, message: "can't be blank" }
  validates :price,          presence: true,
                             numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is invalid' }

  belongs_to :user
  has_one_attached :image
  has_one :purchase_record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :prefectures
  belongs_to :shipping
end
