FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'aaa000' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name             { '太郎' }
    last_name_kana         { 'ヤマダ' }
    first_name_kana        { 'タロウ' }
    birth_day              { '1990-12-31' }
  end
end
