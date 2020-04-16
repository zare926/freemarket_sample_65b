FactoryBot.define do
  
  factory :user do
    nickname              {"yamataro"}
    email                 {"ddd@gmail.com"}
    password              {"a1b2c3d"}
    password_confirmation {"a1b2c3d"}
    family_name           {"山田"}
    first_name            {"太郎"}
    family_name_kana      {"やまだ"}
    first_name_kana       {"たろう"}
    birthday              {"2000/01/01"}
  end
end