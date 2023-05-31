# README
##usersテーブル
| Column             | Type   | Options                       |
| ------------------ | ------ | ------------------------------|
| email              | string | null: false ,unique: true     |
| encrypted_password | string | null: false                   |  
| name               | string | null: false                   |
| nickname           | string | null: false                   |
| date_of_birth      | integer| null: false                   |

##itemsテーブル
| Column             | Type         | Options                       |
| ------------------ | -------------| ------------------------------|
| title              | string       | null: false                   |
| category           | string       | null: false                   |  
| commodity_condition| text         | null: false                   |
| user               | references   | null: false ,foreign_key:true |
| order              | references   | null: false ,foreign_key:true |

##ordersテーブル
 Column              | Type         | Options                       |
| ------------------ | ------------ | ------------------------------|
| amount_of_money    | integer      | null: false                   |
| delivery_charge    | integer      | null: false                   |  
| sender             | string       | null: false                   |
| rough_indication   | text         | null: false                   |
| user               | references   | null: false ,foreign_key:true |
| order              | references   | null: false ,foreign_key:true |


##addresssテーブル
| Column             | Type         | Options                       |
| ------------------ | -------------| ------------------------------|
| post_code          | integer      | null: false                   |
| prefectures        | text         | null: false                   | 
| municipality       | text         | null: false                   |
| address            | text         | null: false                   |
| apartment          | text         | null: false                   |
| order              | references   | null: false ,foreign_key:true |
