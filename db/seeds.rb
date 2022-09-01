require "open-uri"
require "json"

#methods called below
def download_cryptos
  Crypto.destroy_all
  UpdateCryptosJob.perform_now
end

def generate_crypto_comments(cryptos, marius)
  cryptos.each do |c|
    rand(2..10).times do
      CryptoComment.create!(user: marius, crypto: c, content_trix: '<div>Lorem ipsum dolor sit amet,&nbsp;<strong>consectetur adipiscing elit,</strong>&nbsp;<em>sed do eiusmod tempor incididunt</em>&nbsp;</div><ul><li>ut labore et dolore magna aliqua.&nbsp;</li><li>Ut enim ad minim veniam,&nbsp;</li><li>quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.&nbsp;</li></ul><div><a href="https://www.google.com/">Duis aute irure dolor in reprehenderit</a></div>')
    end
  end
end

def generate_crypto_ratings(cryptos, marius)
  CryptoRating.destroy_all

  cryptos.each do |c|
    rand(2..10).times do
      CryptoRating.create!(user: marius, crypto: c, rating: rand(2..5))
    end
  end
end

def generate_post_comments(posts, marius)
  posts.each do |p|
    rand(1..5).times do
      PostComment.create!(user: marius, post: p, content_trix: '<div>Lorem ipsum dolor sit amet,&nbsp;<strong>consectetur adipiscing elit,</strong>&nbsp;<em>sed do eiusmod tempor incididunt</em>&nbsp;</div><ul><li>ut labore et dolore magna aliqua.&nbsp;</li><li>Ut enim ad minim veniam,&nbsp;</li><li>quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.&nbsp;</li></ul><div><a href="https://www.google.com/">Duis aute irure dolor in reprehenderit</a></div>')
    end
  end
end

def generate_post_votes(posts, marius)
  PostVote.destroy_all

  posts.each do |p|
    rand(2..10).times do
      PostVote.create!(user: marius, post: p, upvote: [true, true, true, false].sample)
    end
  end
end

# main seeds
CryptoComment.destroy_all
PostComment.destroy_all
CryptoRating.destroy_all
PostVote.destroy_all
Post.destroy_all
Membership.destroy_all
Squad.destroy_all
User.destroy_all

marius = User.new(email: "marius@hotmail.com", username: "Marius", password: "marius", admin: true)
mantas = User.new(email: "mantas@hotmail.com", username: "Mantas", password: "mantas", admin: true)
tan = User.new(email: "tan@hotmail.com", username: "Tan", password: "tantan", admin: true)

marius.photo.attach(io: URI.open("http://res.cloudinary.com/dqiadt7pm/image/upload/v1661782386/hjqrltjashi2omdr2wbw.jpg"), filename: "marius.jpg", content_type: "image/jpg")
tan.photo.attach(io: URI.open("http://res.cloudinary.com/dqiadt7pm/image/upload/v1661783149/hq4mhosbe1gjr0y4yunz.jpg"), filename: "tan.jpg", content_type: "image/jpg")
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

posts = Post.all
generate_post_comments(posts, marius)
puts "created post comments"

generate_post_votes(posts, marius)
puts "created post votes"

download_cryptos
puts "created cryptos"

cryptos = Crypto.all
generate_crypto_comments(cryptos, marius)
puts "created cryptos comments"

generate_crypto_ratings(cryptos, marius)
puts "created cryptos ratings"

puts "creating squads"
c_t = Chatroom.create
c_m = Chatroom.create

t = Squad.create(title: "Ssup hoe", description: "BTC 100,000", user: tan, chatroom: c_t)
puts "yas"
m = Squad.create(title: "E-money", description: "We're a group of people trying to get rich quick", user: mantas, chatroom: c_m)

puts "populating squads"

Membership.create(squad: t, user: tan)
Membership.create(squad: t, user: marius)
Membership.create(squad: t, user: mantas)
Membership.create(squad: m, user: mantas)
