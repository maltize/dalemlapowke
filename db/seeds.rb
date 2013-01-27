# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

1000.times do |i|

  bribe = Bribe.create(
    :kind => rand(4) + 1,
    :area => rand(16) + 1,
    :service => rand(19) + 1,
    :year => "2012",
    :month => "12",
    :amount => rand(500) + 50,
    :subject => "#{rand(99999999)} testowa łapówka",
    :description => "W sumie #{rand(9999)} nie mam nic do dodania. W sumie #{rand(9999)} nie mam nic do dodania. W sumie #{rand(9999)} nie mam nic do dodania. W sumie #{rand(9999)} nie mam nic do dodania. W sumie #{rand(9999)} nie mam nic do dodania."
  )

  bribe.user = "127.0.0.1"
  bribe.save
  bribe.valid!

  comment = bribe.comments.build
  comment.comment = "Taki właśnie #{rand(99999999)} ciekawy komentarz. Taki właśnie #{rand(99999999)} ciekawy komentarz. Taki właśnie #{rand(99999999)} ciekawy komentarz."
  comment.save

  comment.user = "127.0.0.1"
  comment.save
  comment.valid!

end