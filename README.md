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
| name1              | string | null: false |
| name2              | string | null: false |
| name3              | string | null: false |
| name4              | string | null: false |
| birth              | date   | null: false |

### Association

- has_many :item
- has_many :buyer

## itemsテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_name          | string | null: false, unique: true |
| item_price         | integer | null: false |
| delivery_cost      | integer | null: false |
| item_condition     | string | null: false |
| prefectures        | string | activehash  |
| delivery_days      | string | null: false |
| category           | string | null: false |
| user               | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer

## buyersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user            | reference | null: false, foreign_key: true |
| items           | reference | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :custom

## customsテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| buyer              | reference | null: false, foreign_key: true |
| post_code          | string | null: false |
| prefectures        | string | activehash  |
| city               | string | null: false |
| address            | string | null: false |
| building           | string |             |
| telephone_number   | string | null: false |

### Association

- belongs_to :buyer