FactoryBot.define do

  factory :item do
    name              {"太郎"}
    status            {1}
    description       {"いいよ"}
    brand             {"無印"}
    state             {1}
    postage           {2}
    prefecture        {"東京都"}
    shipping_date     {1}
    price             {900}
    user
    category_id       {11}
  end

end