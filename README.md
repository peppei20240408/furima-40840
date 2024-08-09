## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birth_date_year    | integer | null: false |
| birth_date_month   | integer | null: false |
| birth_date_date    | integer | null: false |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | text       | null: false |
| description        | text       | null: false |
| category           | integer    | null: false |
| condition          | integer    | null: false |
| delivery_charge    | integer    | null: false |
| shipping_area      | integer    | null: false |
| shipping_days      | integer    | null: false |
| price              | integer    | null: false |
| user_id            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :purchase

## purchases テーブル
| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :shipping_address

## shipping_addresses テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| postal_code        | integer    | null: false |
| prefecture         | integer    | null: false |
| city               | string     | null: false |
| address            | string     | null: false |
| building_name      | string     |             |
| phone_number       | integer    | null: false |
| purchase_id        | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase