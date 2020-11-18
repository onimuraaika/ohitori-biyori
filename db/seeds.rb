# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#ジャンルの初期設定
Genre.create!(name: 'おでかけ')
Genre.create!(name: '生活雑貨')
Genre.create!(name: 'ファッション')
Genre.create!(name: 'グルメ')
Genre.create!(name: 'ライフスタイル')
