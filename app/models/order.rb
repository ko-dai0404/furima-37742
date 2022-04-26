class Order < ApplicationRecord
  belongs_to :purchase_record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefectures
end
