# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

##ER図 https://gyazo.com/d935d3dcbe59d07f20a9be46df8c6709

## usersテーブル

|カラム名|カラム型|オプション|
|nickname|string|NOT NULL|
|passward|string|NOT NULL|
|e-mail|string|users, :email, unique: true|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_manth|integer|null: false|
|birth_day|integer|null: false|
|introduction|text|任意|
|avatar|string|任意|
|user_id|integer|null: false, foreign_key: true|


### Association

belongs_to :credit-card
belongs_to :address
has_many :likes
has_many :items, through: :comments


## addressesテーブル

|カラム名|カラム型|オプション|
|address_first_name|string|null: false|
|address_family_name|string|null: false|
|address_first_name_kana|string|null: false|
|address_family_name_kana|string|null: false|
|post_code|integer|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
|house_number|integer|null: false|
|building_name|string|任意|
|phone_number|integer|任意|
|user_id|integer|null: false, foreign_key: true|

### Association

belongs_to :user

## itemsテーブル

|カラム名|カラム型|オプション|
|name|srting|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|brand_id|integer|任意|
|item_condition|string|null: false|
|shipping_area|string|null: false|
|size|string|null: false|
|preparation_day|datetime|null: false|
|image|string|null: false|
|category_id|integer|null: false, foreign_key: true|
|trading_status|string|null: false|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false, foreign_key: true|
|postage_type|string|null: false|
|deal_closed_date|datetime||

### Association

belongs_to :like
belongs_to :category
belongs_to :brand
has_many :images
has_many :users, through:comments

## credit-cardsテーブル

|カラム名|カラム型|オプション|
|card_number|integer|null: false|
|expriation_year|integer|null: false|
|expriation_month|integer|null: false|
|seculity_code|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association

belongs_to :user

## commentsテーブル

|カラム名|カラム型|オプション|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|comment|text|null: false|
|created_at|string||

### Association

has_many :users
has_many :items

## likesテーブル

|カラム名|カラム型|オプション|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association

has_many :items
belongs_to :user

## categoriesテーブル
# 
|name|string|null: false|

### Association

has_many :items

## brandsテーブル

|カラム名|カラム型|オプション|
|name|string|null: false|

### Association

has_many :items

## imagesテーブル

|カラム名|カラム型|オプション|
|item_id|integer|null: false, foreign_key: true|
|url|string|null: false|

### Association

belongs_to :item

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
