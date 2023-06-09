# README
##usersテーブル
| Column             | Type   | Options                       |
| ------------------ | ------ | ------------------------------|
| nickname           | string | null: false                   |
| email              | string | null: false ,unique: true     |
| encrypted_password | string | null: false                   |  
| last_name          | string | null: false                   |
| first_name         | string | null: false                   |
| last_name_kana     | string | null: false                   |
| first_name_kana    | string | null: false                   |
| birth_date         | date   | null: false                   |

- has_many :items
- has_many :orders


##itemsテーブル
| Column             | Type         | Options                       |
| ------------------ | -------------| ------------------------------|
| item_name          | string       | null: false                   |
| item_price         | integer      | null: false                   |
| item_info          | text         | null: false                   |
| category_id   | integer      | null: false                   |
| sales_status_id | integer    | null: false                   |
| shipping_fee_status_id | integer| null: false                |
| prefecture_id | integer      | null: false               |
| scheduled_delivery_id |integer | null: false                 |
| user               | references   | null: false ,foreign_key:true |

- belongs_to :user
- has_one :order

##ordersテーブル
 Column              | Type         | Options                       |
| ------------------ | ------------ | ------------------------------|
| user               | references   | null: false ,foreign_key:true |
| item               | references   | null: false ,foreign_key:true |

- belongs_to :item
- belongs_to :user
- has_one :address


##addressesテーブル
| Column             | Type         | Options                       |
| ------------------ | -------------| ------------------------------|
| postal_code        | string       | null: false                   |
| item_prefecture_id | integer      | null: false                   |
| city               | string       | null: false                   |
| addresses          | string       | null: false                   |
| building           | string       |                               |
| phone_number       | string       | null: false                   |
| order              | references   | null: false ,foreign_key:true |

- belongs_to :order
