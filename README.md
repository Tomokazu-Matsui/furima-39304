# README
##usersテーブル
| Column             | Type   | Options                       |
| ------------------ | ------ | ------------------------------|
| nickname           | string | null: false                   |
| email              | string | null: false                   |
| encrypted_password | string | null: false                   |  
| last_name          | string | null: false                   |
| first_name         | string | null: false                   |
| last_name_kana     | string | null: false                   |
| first_name_kana    | string | null: false                   |
| date_of_birth      | date_today| null: false                |

- has_many :items
- has_many :orders


##itemsテーブル
| Column             | Type         | Options                       |
| ------------------ | -------------| ------------------------------|
| item_name          | string       | null: false                   |
| item_price         | integer      | null: false                   |
| item_info          | text         | null: false                   |
| item_category      | integer      | null: false                   |
| item_sales_status  | integer      | null: false                   |
| item_shipping_fee_status| integer | null: false                   |
| item_prefecture    | integer      | null: false                   |
| item_scheduled_delivery integer   | null: false                   |
| user               | references   | null: false ,foreign_key:true |

- belongs_to :users
- has_one :orders

##ordersテーブル
 Column              | Type         | Options                       |
| ------------------ | ------------ | ------------------------------|
| user               | references   | null: false ,foreign_key:true |
| item               | references   | null: false ,foreign_key:true |

- belongs_to :items
- belongs_to :users
- has_one :addreses


##addresesテーブル
| Column             | Type         | Options                       |
| ------------------ | -------------| ------------------------------|
| postal_code        | string       | null: false                   |
| prefecture         | integer      | null: false                   |
| city               | string       | null: false                   |
| addresses          | string       | null: false                   |
| building           | string       | null: false                   |
| phone_number       | string       | null: false                   |
| button             | references   | null: false ,foreign_key:true |

- belongs_to :orders
