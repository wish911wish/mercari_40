Faker::Config.locale = :ja

FactoryBot.define do
  factory :user, aliases: [:seller, :buyer] do
    password = Faker::Internet.password(8)
    user_name = Gimei.name
    address = Gimei.address
    email                     { Faker::Internet.free_email }
    password                  { password }
    password_confirmation     { password }
    nickname                  { user_name.kanji }
    family_name               { user_name.first.kanji }
    first_name                { user_name.last.kanji }
    family_name_kana          { user_name.first.katakana }
    first_name_kana           { user_name.last.katakana }
    birthday                  { Faker::Date.birthday(18, 65) }
    postal_code               { "#{Faker::Number.number(3)}-#{Faker::Number.number(4)}" }
    prefectures               { address.prefecture.kanji }
    city                      { address.city.kanji }
    street_address            { "#{address.town}#{rand(10)}-#{rand(10)}-#{rand(10)}"   }
    building                  { address.town.katakana }
    phone_number              { Faker::PhoneNumber.phone_number }
    introduction              { Faker::Lorem.sentences(1) }
    image                     { Faker::File.file_name('foo/bar', 'baz', 'jpg') }
  end
end
