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
## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth              | date   | null: false |

### Association

- has_many :items
- has_many :buyers

## itemsテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_name          | string | null: false |
| item_price         | integer | null: false |
| delivery_cost_id   | integer | null: false |
| item_explanation   | text    | null: false |
| item_condition_id  | integer | null: false |
| prefecture_id      | integer | null: false  |
| delivery_days_id   | integer | null: false |
| category_id        | integer | null: false |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer

## buyersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :custom

## customsテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| buyer              | references | null: false, foreign_key: true |
| post_code          | string | null: false |
| prefecture_id      | integer | null: false |
| city               | string | null: false |
| address            | string | null: false |
| building           | string |             |
| telephone_number   | string | null: false |

### Association

- belongs_to :buyer