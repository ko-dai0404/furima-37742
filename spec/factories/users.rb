FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 3) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) + '1a' }
    password_confirmation { password }
    last_name             { '下村' }
    first_name            { '晃大' }
    last_name_kana        { 'シモムラ' }
    first_name_kana       { 'コウダイ' }
    birthday              { '19930404' }
  end
end
