
# Category.create!(
#   id: "2",
#   name: "メンズ",
# )

# Category.create!(
#   id: "3",
#   name: "ベビー・キッズ",
# )

# Category.create!(
#   id: "4",
#   name: "インテリア・住まい・小物"
# )

# Category.create!(
#   id: "5",
#   name: "本・音楽・ゲーム"
# )

# Category.create!(
#   id: "6",
#   name: "おもちゃ・ホビー・グッズ"
# )

# Category.create!(
#   id: "7",
#   name: "コスメ・香水・美容"
# )

# Category.create!(
#   id: "8",
#   name: "家電・スマホ・カメラ"
# )

# Category.create!(
#   id: "9",
#   name: "スポーツ・レジャー"
# )

# Category.create!(
#   id: "10",
#   name: "ハンドメイド"
# )

# Category.create!(
#   id: "11",
#   name: "チケット"
# )

# Category.create!(
#   id: "12",
#   name: "自転車・オートバイ"
# )

# Category.create!(
#   id: "13",
#   name: "その他"
# )

lady = Category.create(:name=>"レディース")
men = Category.create(:name=>"メンズ")
baby = Category.create(:name=>"ベビー・キッズ")
interia = Category.create(:name=>"インテリア・住まい・小物")
book = Category.create(:name=>"本・音楽・ゲーム")
toy = Category.create(:name=>"おもちゃ・ホビー・グッズ")
cosme = Category.create(:name=>"コスメ・香水・美容")
kaden = Category.create(:name=>"家電・スマホ・カメラ")
sports = Category.create(:name=>"スポーツ・レジャー")
handmade = Category.create(:name=>"ハンドメイド")
ticket = Category.create(:name=>"チケット")
bike = Category.create(:name=>"自転車・オートバイ")
other = Category.create(:name=>"その他")


lady_tops = lady.children.create(:name=>"トップス")
lady_jacket = lady.children.create(:name=>"ジャケット/アウター")
lady_pantu = lady.children.create(:name=>"パンツ")
lady_skirt = lady.children.create(:name=>"スカート")
lady_onepiece = lady.children.create(:name=>"ワンピース")
lady_sox = lady.children.create(:name=>"ソックス")
lady_cap = lady.children.create(:name=>"帽子")
lady_bag = lady.children.create(:name=>"バッグ")
lady_other = lady.children.create(:name=>"その他")

lady_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"},{:name=>"その他"}])
lady_jacket.children.create([{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"}, {:name=>"Gジャン/デニムジャケット"},{:name=>"その他"}])
lady_pantu.children.create([{:name=>"デニム"}, {:name=>"ショート"}, {:name=> "その他"}])
lady_skirt.children.create([{:name=>"ロング"}, {:name=>"ショート"}, {:name=>"その他"}])
lady_onepiece.children.create([{:name=>"ミニ"}, {:name=>"ロング"}, {:name=>"その他"}])
lady_sox.children.create([{:name=>"ミニ"}, {:name=>"ロング"}, {:name=>"その他"}])
lady_cap.children.create([{:name=>"キャップ"}, {:name=>"その他"}])
lady_bag.children.create([{:name=>"ハンド"}, {:name=>"トート"}, {:name=>"その他"}])
lady_other.children.create([{:name=>"水着"}, [:name=>"コスプレ"], {:name=>"その他"}])


men_tops = men.children.create(:name=>"トップス")
men_jacket = men.children.create(:name=>"ジャケット/アウター")
men_pantu = men.children.create(:name=>"パンツ")
men_shoes = men.children.create(:name=>"靴")
men_bag = men.children.create(:name=>"バッグ")
men_suit = men.children.create(:name=>"スーツ")
men_other = men.children.create(:name=>"その他")

men_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"},{:name=>"その他"}])
men_jacket.children.create([{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"}, {:name=>"Gジャン/デニムジャケット"},{:name=>"その他"}])
men_pantu.children.create([{:name=>"デニム"}, {:name=>"ショート"}, {:name=> "その他"}])
men_shoes.children.create([{:name=>"スニーカー"}, {:name=>"革靴"}, {:name=>"その他"}])
men_bag.children.create([{:name=>"ハンド"}, {:name=>"トート"}, {:name=>"その他"}])
men_suit.children.create([{:name=>"カジュアル"}, {:name=>"フォーマル"}, {:name=>"その他"}])
men_other.children.create([{:name=>"水着"}, [:name=>"コスプレ"], {:name=>"その他"}])


baby_infant = baby.children.create(:name=>"ベビー服")
baby_kids = baby.children.create(:name=>"キッズ服")
baby_toy = baby.children.create(:name=>"おもちゃ")
baby_other = baby.children.create(:name=>"その他")


interia_kitchin = interia.children.create(:name=>"キッチン")
interia_bed = interia.children.create(:name=>"ベッド")
interia_mini = interia.children.create(:name=>"インテリア小物")
interia_other = interia.children.create(:name=>"その他")

book_hon = book.children.create(:name=>"本")
book_dvd = book.children.create(:name=>"DVD")
book_game = book.children.create(:name=>"ゲーム")
book_other = book.children.create(:name=>"その他")

toy_item = toy.children.create(:name=>"おもちゃ")
toy_music = toy.children.create(:name=>"楽器")
toy_other = toy.children.create(:name=>"その他")

cosme_item = cosme.children.create(:name=>"化粧品")
cosme_puf = cosme.children.create(:name=>"香水")
cosme_beauty = cosme.children.create(:name=>"美容")
cosme_other = cosme.children.create(:name=>"その他")

kaden_item = kaden.children.create(:name=>"家電")
kaden_sumaph = kaden.children.create(:name=>"スマホ")
kaden_camera = kaden.children.create(:name=>"カメラ")
kaden_other = kaden.children.create(:name=>"その他")

sports_sport = sports.children.create(:name=>"スポーツ")
sports_reja = sports.children.create(:name=>"レジャー")

bike_bicycle = bike.children.create(:name=>"自転車")
bike_auto = bike.children.create(:name=>"オートバイ")
