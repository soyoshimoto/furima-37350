# DB設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| lastname           | string              | null: false               |
| firstname          | string              | null: false               |
| lastname_ruby      | string              | null: false               |
| firstname_ruby     | string              | null: false               |
| nickname           | string              | null: false               |
| birthday           | date                | null: false               |

### Association

* has_many :items
* has_many :purchase_records

## items table

| Column                     | Type                | Options                        |
|----------------------------|---------------------|--------------------------------|
| items_name                 | string              | null: false                    |
| explanation                | text                | null: false                    |
| category_id                | integer             | null: false                    |
| condition_id               | integer             | null: false                    |
| shipping_charges_burden_id | integer             | null: false                    |
| prefecture_id              | integer             | null: false                    |
| shipping_day_id            | integer             | null: false                    |
| price                      | integer             | null: false                    |
| user                       | references          | null: false, foreign_key: true |

### Association

* has_one :purchase_record
* belongs_to :user

## purchase_records table

| Column                  | Type                | Options                        |
|-------------------------|---------------------|--------------------------------|
| user                    | references          | null: false, foreign_key: true |
| item                    | references          | null: false, foreign_key: true |

### Association

* has_one :shipping_address
* belongs_to :user
* belongs_to :item

## shipping_addresses table

| Column                  | Type                | Options                        |
|-------------------------|---------------------|--------------------------------|
| postcode                | string              | null: false                    |
| prefecture_id           | integer             | null: false                    |
| municipalities          | string              | null: false                    |
| address                 | string              | null: false                    |
| building_name           | string              |                                |
| phonenumber             | string              | null: false                    |
| purchase_record         | references          | null: false, foreign_key: true |

### Association

* belongs_to :purchase_record