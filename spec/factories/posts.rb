FactoryBot.define do
  factory :post do
    # Faker:: → Fakerを使用する時の宣言
    # Lorem → ダミーテキストタイプを選択　※Lorem=lorem ipsumの略でダミーテキストの意味
    # characters → 文字列を作成
    # number → 生成文字数の指定
    place { Faker::Lorem.characters(number: 5) }
    writings { Faker::Lorem.characters(number: 500) }
  end
end