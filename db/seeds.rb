require "open-uri"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Post.destroy_all
User.destroy_all

marius = User.new(email: "marius@hotmail.com", username: "Marius", password: "marius", admin: true)
mantas = User.new(email: "mantas@hotmail.com", username: "Mantas", password: "mantas", admin: true)
tan = User.new(email: "tan@hotmail.com", username: "Tan", password: "tantan", admin: true)


marius.photo.attach(io: URI.open("http://res.cloudinary.com/dqiadt7pm/image/upload/v1661782386/hjqrltjashi2omdr2wbw.jpg"), filename: "marius.png", content_type: "image/png")
tan.photo.attach(io: URI.open("http://res.cloudinary.com/dqiadt7pm/image/upload/v1661783149/hq4mhosbe1gjr0y4yunz.jpg"), filename: "tan.png", content_type: "image/png")
mantas.photo.attach(io: URI.open("http://res.cloudinary.com/dqiadt7pm/image/upload/v1661783176/il31crrwnmf4sdvqukwo.png"), filename: "mantas.png", content_type: "image/png")

marius.save!
tan.save!
mantas.save!
puts "created users"

Post.create!(user: marius, content: "Why are DeFi protocols so important for the crypto industry?")
Post.create!(user: marius, content: "Who is Satisho satoshi nakamoto?")
Post.create!(user: tan, content: "Tokenomics! My overview on why tokenomics should not be forgotten when launching a crypto currency")
Post.create!(user: tan, content: "My reasons why Bitcoin is the only blockchain that needs to exits")
Post.create!(user: mantas, content: "ETH 2.0 why is it important and how can we as traders benefit?")
Post.create!(user: mantas, content: "The Metaverse, and my cryptos I am keeping an eye one ;)")
puts "created posts"
