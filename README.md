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
- has_many :purchase_records

## items テーブル

| Column         | Type         | Options                        |
| -------------- | ------------ | ------------------------------ |
| product        | string       | null: false                    |
| description    | text         | null: false                    |
| category_id    | integer      | null: false                    |
| status_id      | integer      | null: false                    |
| burden_id      | integer      | null: false                    |
| prefectures_id | integer      | null: false                    |
| shipping_id    | integer      | null: false                    |
| price          | integer      | null: false                    |
| user           | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record


## orders テーブル

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |
| postal          | string       | null: false                    |
| prefectures_id  | integer      | null: false                    |
| city            | string       | null: false                    |
| address         | string       | null: false                    |
| building        | string       |                                |
| telephone       | string       | null: false                    |
| purchase_record | references   | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record

# purchase_records テーブル

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |
| user            | references   | null: false, foreign_key: true |
| item            | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :order