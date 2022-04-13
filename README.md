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
| profile            | text   | null: false |
|last_name          | text   | null: false |
| first_name           | text   | null: false |
| birth_day           | date   | null: false |
| item_id           | reference   |          |

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| product_name       | text   | null: false |
| price          | integer | null: false |
| condition          | integer | null: false, foreign_key: true |
| user_id               | references | null: false, foreign_key: true |
| brand_id              | references | null: false, foreign_key: true |
| category_id           | references | null: false, foreign_key: true |



## address テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| address   | text      | null: false |
| post_code | integer  | null: false |
| city      | text      | null: false |
| prefectures | referense  | null: false,foreign_key: true |
| user_id | referense  | null: false,foreign_key: true |

