# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

##ER図 https://gyazo.com/8a38543722a5fa2fe20930f8fe702319
  
## usersテーブル

|カラム名|カラム型|オプション|
|------|----|-------|
|nickname|string|null: false|
|password|string|null: false|
|e-mail|string|users, :email, unique: true|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_pseudonym|string|null: false|
|family_name_pseudonym|string|null: false|
|birth_year|string|null: false|
|birth_month|string|null: false|
|birth_day|string|null: false|
|introduction|text|任意|
|avatar|string|任意|
|address_first_name|string|null: false|
|address_family_name|string|null: false|
|address_first_pseudonym|string|null: false|
|address_family_pseudonym|string|null: false|
|post_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address_name|string|null: false|
|building_name|string|任意|
|phone_number|string|任意|

### Association

- has_one :credit-card
- has_one :address
- has_many :likes
- has_many :items, through: :comments

## itemsテーブル

|カラム名|カラム型|オプション|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|brand_id|integer|foreign_key: true|
|item_condition_id|string|null: false|
|shipping_area_id|string|null: false|
|size|string|null: false|
|preparation_day_id|datetime|null: false|
|category_id|integer|null: false, foreign_key: true|
|trading_status_id|string|null: false|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false, foreign_key: true|
|postage_type_id|string|null: false|
|deal_closed_date|datetime||

### Association

- belongs_to :category
- belongs_to :brand
- has_many :images
- belongs_to :user, through:comments
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :shipping_area
- belongs_to_active_hash :preparation_day
- belongs_to_active_hash :trading_status
- belongs_to_active_hash :postage_type

## credit-cardsテーブル

|カラム名|カラム型|オプション|
|------|----|-------|
|card_number|integer|null: false|
|expriation_year|integer|null: false|
|expriation_month|integer|null: false|
|seculity_code|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :user

## commentsテーブル

|カラム名|カラム型|オプション|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|comment|text|null: false|
|created_at|string||

### Association

- belongs_to :user
- belongs_to :item

## likesテーブル

|カラム名|カラム型|オプション|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :item
- belongs_to :user

## categoriesテーブル
# 
|カラム名|カラム型|オプション|
|------|----|-------|
|name|string|null: false|

### Association

- has_many :items

## brandsテーブル

|カラム名|カラム型|オプション|
|------|----|-------|
|name|string|null: false|

### Association

- has_many :items

## imagesテーブル

|カラム名|カラム型|オプション|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|url|string|null: false|

### Association

- belongs_to :item

# 
* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
