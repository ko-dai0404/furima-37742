class Shipping < ActiveHash::Base
  self.data = [
    { id: 1, whatday: '---' },
    { id: 2, whatday: '1~2日で発送' },
    { id: 3, whatday: '2~3日で発送' },
    { id: 4, whatday: '4~7日で発送' }
  ]
  include ActiveHash::Associations
  has_many :items
end
