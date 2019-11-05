FactoryBot.define do
  factory :user do
    nickname              {"yamada"}
    email                 {"yamada123@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    family_name           {"山田"}
    last_name             {"太郎"}
    kana_family_name      {"ヤマダ"}
    kana_last_name        {"タロウ"}
    birth_year            {"1995"}
    birth_month           {"01"}
    birth_day             {"10"}
    phone_number          {"09012345678"}
    #prefecture_id         {"1"}
    #municipal             {"名古屋市"}
    #address               {"中央区中央町1-1"}
    #credit_card_num       {1020304050607080}
    #credit_card_month     {"01"}
    #credit_card_year      {"25"}
    #credit_card_security  {1234}
  end
end
