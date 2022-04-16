# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| name_kana          | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :comments
- has_many :shipping_informations
- has_many :purchase_records

## items テーブル

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |
| product         | string       | null: false                    |
| description     | text         | null: false                    |
| category        | string       | null: false                    |
| status          | string       | null: false                    |
| burden          | string       | null: false                    |
| shipment_source | string       | null: false                    |
| shipping        | string       | null: false                    |
| price           | integer      | null: false                    |
| user            | references   | null: false, foreign_key: true |
| purchase_record | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
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

| Column      | Type         | Options                        |
| ----------- | ------------ | ------------------------------ |
| postal      | integer      | null: false                    |
| prefectures | string       | null: false                    |
| city        | string       | null: false                    |
| address     | string       | null: false                    |
| building    | string       | null: false                    |
| telephone   | bigint       | null: false                    |
| user        | references   | null: false, foreign_key: true |
| item        | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_many :purchase_records

# purchase_records テーブル

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |
| user            | references   | null: false, foreign_key: true |
| purchase_record | references   | null: false, foreign_key: true |
| purchase_record | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :shipping_information
- has_one :item