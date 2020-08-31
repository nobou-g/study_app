### セミナー開催アプリ
![session](https://github.com/nobou-g/study_app/blob/master/gyazo1.jpg)

# :ledger:開発環境
・Ruby  
・Rails  
・Javascript  
・jquery  
・MySQL  
・Payjp(クレジットカードのAPI)  
・VSCode  

# :ledger:アプリ機能
![audio_visualizer](https://github.com/nobou-g/study_app/blob/master/%E3%83%88%E3%83%83%E3%83%95%E3%82%9A%E3%83%98%E3%82%9A%E3%83%BC%E3%82%B7%E3%82%99.gif)


# DB設計

## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null:false, unique:true|
|email|text|null:false, unique:true|
|affiliation|text|null:false|

### Association

- has_many :messages
- has_many :events
- has_many :relationships
- has_many :followings, through: :relationships, source: :follow
- has_many :reverse_of_relationship, class_name: 'Relationship', foreign_key: follow_id
- has_many :followers, through: :reverse_of_relationship, source: :user

## Eventsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null:false|
|discription|text|null:false|
|image|binary||
|place|string|null:false|
|date|string|null:false|
|user_id|reference|foreign_key:true|

### Association
- belong_to :user
- has_many :messages

## Relationshipテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key:true|
|follow_id|reference|foreign_key:true|

### Association
- belong_to :user

## Messagesテーブル

|Column|Type|Options|
|------|----|-------|
|content|text|null:false, unique:true|
|user_id|reference|foreign_key:true|
|event_id|reference|foreign_key|

### Association
- belongs_to :user
- belongs_to :event
