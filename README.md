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



## Name

Airbnb


## Description

Anyone can experience special travel with Airbnb.


## Database

#### Users

|column                |   type   |                                               option|
|:--------------------:|:--------:|:---------------------------------------------------:|
|email                 |  string  |                                null: false, default:|
|incrypted_password    |  string  |                                null: false, default:|
|reset_password_token  |  string  |                                                     |
|reset_password_sent_at| datetime |                                                     |
|remember_created_at   | datetime |                                                     |
|sign_in_count         | integer  |                              default: 0, null: false|
|current_sign_in_at    | datetime |                                                     |
|last_sign_in_at       | datetime |                                                     |
|current_sign_in_ip    |  string  |                                                     |
|last_sign_in_ip       |  string  |                                                     |
|                      |timestamps|                                          null: false|
|                      |          |               add_index :users, :email, unique: true|
|                      |          |add_index :users, :reset_password_token, unique: true|
|name                  |  string  |                                          null: false|
|birthday              |  string  |                                                     |
|phone_number          |  string  |                            null: false, unique: true|
|image                 |  string  |                                          null: false|
|profile               |   text   |                                                     |

#### Hosts

|column                |   type   |                                               option|
|:--------------------:|:--------:|:---------------------------------------------------:|
|email                 |  string  |                                null: false, default:|
|incrypted_password    |  string  |                                null: false, default:|
|reset_password_token  |  string  |                                                     |
|reset_password_sent_at| datetime |                                                     |
|remember_created_at   | datetime |                                                     |
|sign_in_count         | integer  |                              default: 0, null: false|
|current_sign_in_at    | datetime |                                                     |
|last_sign_in_at       | datetime |                                                     |
|current_sign_in_ip    |  string  |                                                     |
|last_sign_in_ip       |  string  |                                                     |
|                      |timestamps|                                          null: false|
|                      |          |               add_index :users, :email, unique: true|
|                      |          |add_index :users, :reset_password_token, unique: true|
|name                  |  string  |                                          null: false|
|birthday              |  string  |                                                     |
|phone_number          |  string  |                            null: false, unique: true|
|image                 |  string  |                                          null: false|
|profile               |   text   |                                          null: false|

#### Rooms

|column                |   type   |                                               option|
|:--------------------:|:--------:|:---------------------------------------------------:|
|name                  |  string  |                                          null: false|
|address               |  string  |                            null: false, unique: true|
|image                 |  string  |                                          null: false|
|host_id               |references|                       null: false, foreign_key: true|

#### Information

|column                |   type   |                                               option|
|:--------------------:|:--------:|:---------------------------------------------------:|
|information           |   text   |                                          null: false|
|room_id               |references|                       null: false, foreign_key: true|

#### Prices

|column                |   type   |                                               option|
|:--------------------:|:--------:|:---------------------------------------------------:|
|price                 |  string  |                                          null: false|
|room_id               |references|                       null: false, foreign_key: true|

#### Amenities

|column                |   type   |                                               option|
|:--------------------:|:--------:|:---------------------------------------------------:|
|amenity               |   text   |                                          null: false|
|room_id               |references|                       null: false, foreign_key: true|

#### Booking

|column                |   type   |                                               option|
|:--------------------:|:--------:|:---------------------------------------------------:|
|date                  |  string  |                                          null: false|
|user_id               |references|                       null: false, foreign_key: true|
|host_id               |references|                       null: false, foreign_key: true|
|room_id               |references|                       null: false, foreign_key: true|


## Asociation

#### User

#### Host
  has_many :rooms

#### Room
  belongs_to :host

#### Information
  belongs_to :room

#### Price
  belongs_to :room

#### Amenity
  belongs_to :room

#### Booking
  belongs_to :user
  belongs_to :host
  belongs_to :room
