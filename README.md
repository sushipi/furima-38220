# README

## フリマアプリ

## URL 
 https://furima-38220-app-38220.herokuapp.com/

## 実装機能　
* Basic認証
* ユーザー管理機能
* 商品出品機能
* 商品一覧機能
* 商品詳細機能
* 商品情報編集機能
* 商品削除機能
* 商品購入機能
* S3の導入

## テーブル設計 

### usersテーブル
|Column                 |Type    |Options                    |
|-----------------------|--------|---------------------------|
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| family_name           | string | null: false               |
| given_name            | string | null: false               |
| family_name_kana      | string | null: false               |
| given_name_kana       | string | null: false               |
| birth_date            | date   | null: false               |

### Association
- has_many :items
- has_many :purchases
- has_many :comments


### itemsテーブル
|Column           |Type        |Options                         |
|-----------------|----------- |--------------------------------|
| name            | string     | null: false                    |
| explanation     | text       | null: false                    | 
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| prefecture _id  | integer    | null: false                    | 
| day_id          | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- has_one :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :days


### purchasesテーブル
|Column|Type        |Options                         |
|------|------------|--------------------------------|
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address




### shipping_addressesテーブル
|Column         |Type        |Options                           |
|---------------|------------|----------------------------------|
| post_code     | string     | null: false                      |
| prefecture_id | integer    | null: false                      | 
| city          | string     | null: false                      |
| address       | string     | null: false                      |
| building_name | string     |                                  |
| phone_number  | string     | null: false                      |
| purchase      | references | null: false, foreign_key: true   |

### Association
- has_one_active_hash :prefectures
- belongs_to :purchase





## commentsテーブル
|Column   |Type        | Options                        |
|---------|----------- | -------------------------------|
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item









