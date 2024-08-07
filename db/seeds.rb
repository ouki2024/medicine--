# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'admin@admin',
   password: 'password'
)

users_params = [
    {
      id: 1,
      email: "test1@test.com",
      password: "password",
      nickname: "akiyama"
    },
    {
      id: 2,
      email: "test2@test.com",
      password: "password",
      nickname: "haru"
    },
    {
      id: 3,
      email: "test3@test.com",
      password: "password",
      nickname: "itigo"
    },
  ]

users_params.each do |user_params|
  User.create!(user_params)
end

tag_names = %w(
    薬局で受け取り可
    院内処方可
    複数薬局あり
    駅近
  )

tag_names.each do |name|
  Tag.create!(name: name)
end

reviews_params = [
    {
      user_id: 1,
      nickname: "akiyama",
      gender: "男",
      hospital: "秋",
      clinical_department: "内",
      pharmacy: "あき薬局",
      use_count: "初めて",
      address: "神奈川県",
      age: 40,
      visit_month: 7,
      cost: 1500,
      content: "病院内の雰囲気もよく過ごしやすかったです。"
    },
    {
      user_id: 2,
      nickname: "huyu",
      gender: "女",
      hospital: "はるやま",
      clinical_department: "婦人",
      pharmacy: "はるた",
      use_count: "初めて",
      address: "神奈川県",
      age: 30,
      visit_month: 3,
      cost: 1500,
      content: "病院内も静かで混んでいなかったので快適に過ごすことができました。"
    },
    {
      user_id: 3,
      nickname: "itigo",
      gender: "男",
      hospital: "春",
      clinical_department: "内",
      pharmacy: "はる",
      use_count: "初めて",
      address: "神奈川県",
      age: 20,
      visit_month: 7,
      cost: 1500,
      content: "病院内の雰囲気もよく過ごしやすかったです。"
    },
    {
      user_id: 3,
      nickname: "itigo",
      gender: "男",
      hospital: "ゆたか",
      clinical_department: "胃腸",
      pharmacy: "はる",
      use_count: "2回目",
      address: "神奈川県",
      age: 20,
      visit_month: 8,
      cost: 1500,
      content: "病院内の雰囲気もよく過ごしやすかったです。"
    }
  ]

tags = Tag.all

reviews_params.each do |review_params|
  review = Review.create!(review_params)
  (tags.pluck(:id)).sample(rand(0..3)).each do |tag_id|
    review.tag_relationships.create!(tag_id: tag_id)
  end
end



if Rails.env.development?
   #開発環境のみで稼働する場所
end