FactoryBot.define do
  
  factory :address do
    address_family_name       {"山田"}
    address_first_name        {"太郎"}
    address_family_name_kana  {"やまだ"}
    address_first_name_kana    {"たろう"}
    postcode                  {"1330011"}
    prefecture                {"東京都"}
    address_city              {"渋谷区"}
    address_block             {"町1-1-1"} 
    address_building          {"テストビル201"}
    phone_number              {"09012345678"} 
  end
end