# DB設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| name               | string              | null: false               |
| nickname           | string              | null: false               |
| birthday           | date                | null: false               |

### Association

* has_many :items
* has_many :purchase_records

## items table

| Column                  | Type                | Options                        |
|-------------------------|---------------------|--------------------------------|
| image                   | string              | null: false                    |
| items_name              | text                | null: false                    |
| explanation             | text                | null: false                    |
| category                | string              | null: false                    |
| condition               | string              | null: false                    |
| shipping_charges_burden | text                | null: false                    |
| price                   | string              | null: false                    |
| user_id                 | references          | null: false, foreign_key: true |

### Association

* has_many :shipping_addresses
* has_one :purchase_record
* belongs_to :user

## purchase_records table

| Column                  | Type                | Options                        |
|-------------------------|---------------------|--------------------------------|
| user_id                 | references          | null: false, foreign_key: true |
| item_id                 | references          | null: false, foreign_key: true |

### Association

* has_one :shipping_address
* belongs_to :user
* belongs_to :item

## shipping_addresses table

| Column                  | Type                | Options                        |
|-------------------------|---------------------|--------------------------------|
| postcode                | string              | null: false                    |
| prefecture              | string              | null: false                    |
| municipalities          | string              | null: false                    |
| address                 | string              | null: false                    |
| buildingname            | string              | null: false                    |
| phonenumber             | string              | null: false                    |
| item_id                 | references          | null: false, foreign_key: true |
| purchaserecord_id       | references          | null: false, foreign_key: true |

### Association

* belongs_to :purchase_record
* belongs_to :item
