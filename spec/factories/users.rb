FactoryBot.define do
  factory :user do
      transient do
       person { Gimei.name }
      end
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {"7a" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password} 
    first_name { person.first.kanji }
    last_name { person.last.kanji }
    first_name_kana { person.first.katakana }
    last_name_kana { person.last.katakana }
    birth { Faker::Date.backward }
  end
end

