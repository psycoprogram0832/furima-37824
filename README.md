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
has_one :purchases

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| product_name       | string   | null: false |
| introduction       | text   | null: false |
| price              | integer | null: false |
| condition          | integer | null: false, foreign_key: true |
| user_id               | integer | null: false, foreign_key: true |
| brand_id           | integer | null: false, foreign_key: true |
| category_id        | integer | null: false, foreign_key: true |
| prefecture_id        | integer | null: false, foreign_key: true |
| delivery_charge_id        | integer | null: false, foreign_key: true |

belongs_to :user
has_one :purchases



## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user_id   | integer      | null: false, foreign_key: true |
| item_id | integer  | null: false,foreign_key: true |

belongs_to :user
belongs_to :item
has_one :address

## address テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| address   | text      | null: false |
| building  | text      | null: false |
| post_code | integer  | null: false |
| city      | text      | null: false |
| prefectures | referense  | null: false,foreign_key: true |
| purchase_id | integer  | null: false,foreign_key: true |

 belongs_to :purchase


