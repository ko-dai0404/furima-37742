# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :comments
- has_many :shipping_informations
- has_many :purchase_records

## items テーブル

| Column               | Type         | Options                        |
| -------------------- | ------------ | ------------------------------ |
| product              | string       | null: false                    |
| description          | text         | null: false                    |
| category_id          | integer      | null: false                    |
| status_id            | integer      | null: false                    |
| burden_id            | integer      | null: false                    |
| shipment_source_id   | integer      | null: false                    |
| shipping_id          | integer      | null: false                    |
| price                | integer      | null: false                    |
| user                 | references   | null: false, foreign_key: true |
| shipping_information | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :shipping_information
- has_many :comments
- has_one :purchase_record

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## shipping_informations テーブル

| Column         | Type         | Options                        |
| -------------- | ------------ | ------------------------------ |
| postal         | string       | null: false                    |
| prefectures_id | integer      | null: false                    |
| city           | string       | null: false                    |
| address        | string       | null: false                    |
| building       | string       |                                |
| telephone      | string       | null: false                    |
| user           | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :items
- has_one :purchase_record

# purchase_records テーブル

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |
| user            | references   | null: false, foreign_key: true |
| item            | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item
- has_one :shipping_information