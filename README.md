# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname               | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string   | null: false |
| first_name           | string   | null: false |
| last_name_kana           | string   | null: false |
| first_name_kana           | string   | null: false |
| birth_day           | date   | null: false |

has_many :items
has_many :purchases

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| product_name       | string   | null: false |
| introduction       | text   | null: false |
| price              | integer | null: false |
| condition_id          | integer | null: false, |
| user               | references | null: false, foreign_key: true |
| brand_id           | integer | null: false|
| category_id        | integer | null: false|
| prefecture_id        | integer | null: false|
| delivery_charge_id        | integer | null: false|

belongs_to :user
has_one :purchase



## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references  | null: false, foreign_key: true |
| item | references  | null: false,foreign_key: true |

belongs_to :user
belongs_to :item
has_one :address

## address テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| address   | string      | null: false |
| building  | string      | null: false |
| post_code | string  | null: false |
| city      | string      | null: false |
| phone_number      | string      | null: false |
| prefecture_id | integer  | null: false, |
| purchase | references  | null: false,foreign_key: true |

 belongs_to :purchase


