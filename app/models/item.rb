class Item < ApplicationRecord
  # belongs_to :category
  # belongs_to :brand #optional: true
  belongs_to :user
  has_many :images
  belongs_to :brand
  # belongs_to :user #optional: true#through:comments

  #画像複数投稿
  accepts_nested_attributes_for :images, allow_destroy: true
  
  #必須（商品名40文字以内）
  validates :name, presence: true, length: { maximum: 40}
  #必須（商品説明文1000文字以内）
  validates :introduction, presence: true, length: { maximum: 1000 }
  #必須（価格300~9,999,999）
  validates :price, presence: true , numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  #必須（カテゴリー、商品の状態、発送元地域、発送までの日数、配送料の負担者、）
  validates :category_id, :item_condition, :shipping_area, :preparation_day, :trading_status, presence: true
  def images_presence
    if images.attached?
      # inputに保持されているimagesがあるかを確認
      if images.length > 10
        errors.add(:image, '10枚まで投稿できます')
      end
    else
      errors.add(:image, '画像がありません')
    end
  end
  enum item_condition: {
    新品、未使用:1, 未使用に近い:2, 目立った傷や汚れなし:3, やや傷や汚れあり:4, 傷や汚れあり:5, 全体的に状態が悪い:6
  }
  enum shipping_area: {
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,岐阜県:21,静岡県:22,愛知県:23,三重県:24,滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,徳島県:36,香川県:37,愛媛県:38,高知県:39,福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  }
  enum trading_status: {
    送料込み:1, 着払い:2
  }
  enum postage_type: {
    未定:1, クロネコヤマト:2, ゆうパック:3, ゆうメール:4, らくらくメルカリ便:5, レターパック:6, 普通郵便（定形、定形外）:7, クリックポスト:8, ゆうパケット:9
  }
  enum preparation_day: {
    １〜２日で発送:1, ２〜３日で発送:2, ４〜７日で発送:3
  }
  enum brand_id:{
    ナイキ:1
  }
  enum category_id:{
    靴:1
  }

end