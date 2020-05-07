FactoryBot.define do
  factory :user do
    nickname              { "門左衛門" }
    family_name           { "門左衛" }
    first_name            { "門" }
    family_name_pseudonym { "ザンギ" }
    first_name_pseudonym  { "エフ" }
    birth_year            { "2001" }
    birth_month           { "12" }
    birth_day             { "34" }
    email                 { "anpanchi@gmail.com" }
    password              { "honwaka2627" }
    password_confirmation { "honwaka2627" }
    address_first_name    { "門左衛" }
    address_family_name   { "五郎" }
    address_first_pseudonym { "チュン" }
    adress_family_pseudonym { "リー" }
    post_code             { "3450021" }
    prefecture            { "福岡県" }
    city                  { "東九州市" }
    address_name          { "本革４−５" }
  end
end

