# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Sparkle DB設計
## usersテーブル

|Column|Type|Option|
|------|----|------|
|email|string|null: false|
|password|string|null: false|
|username|string|null: false|

### Association
- has_many :posts
- has_many :comments


## postsテーブル
|Column|Type|Option|
|------|----|------|
|content|text||
|title|text||
|picture|string||
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :users
- has_many :comments

## productsテーブル
|Column|Type|Option|
|------|----|------|
|name|text||
|image|string||
|text|text|null: false|

### Association
belongs_to :users

## commentsテーブル
|Column|Type|Option|
|------|----|------|
|message|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|posts_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :posts
- belongs_to :users