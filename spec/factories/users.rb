FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 10, min_alpha: 4, min_numeric: 1) }
    password_confirmation {password}
    family_name           { Gimei.first.kanji }
    given_name            { Gimei.last.kanji }
    family_name_kana      { Gimei.first.katakana }
    given_name_kana       { Gimei.last.katakana }
    birth_date            { Faker::Date.backward }
  end
end