FactoryBot.define do
  factory :user do
    nickname              {"yamada"}
    email                 {"yamada123@gmail.com"}
    password              {"1111aaaa"}
    password_confirmation {"1111aaaa"}
    family_name           {"山田"}
    last_name             {"太郎"}
    kana_family_name      {"ヤマダ"}
    kana_last_name        {"タロウ"}
    birth_year            {"1995"}
    birth_month           {"01"}
    birth_day             {"10"}
    phone_number          {"09012345678"}
    residence_id          {"1"}
  end
end
