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
| birth              | string | null: false |

### Association

- has_many :items
- has_many :buyers

## itemsテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_image         | string | null: false |
| item_name          | string | null: false, unique: true |
| item_price         | string | null: false |
| delivery           | string   | null: false |
| user               | reference | foreign_key: true |

### Association

- belongs_to :users
- has_one :buyers

## buyersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user            | reference | null: false, foreign_key: true |
| items           | reference | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :users
- has_one :customs

## customsテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| post_code          | string | null: false |
| prefectures        | string | null: false |
| city               | string | null: false |
| address            | string | null: false |
| building           | string | null: true  |
| telephone_number   | string | null: false |

### Association

- belongs_to :buyers