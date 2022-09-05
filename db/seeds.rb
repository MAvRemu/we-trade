require "open-uri"
require "json"

#methods called below
def download_cryptos
  Crypto.destroy_all
  UpdateCryptosJob.perform_now
end

def generate_crypto_comments(cryptos, marius)
  cryptos.each do |c|
    rand(1..3).times do
      CryptoComment.create!(user: marius, crypto: c, content_trix: '<div>Lorem ipsum dolor sit amet,&nbsp;<strong>consectetur adipiscing elit,</strong>&nbsp;<em>sed do eiusmod tempor incididunt</em>&nbsp;</div><ul><li>ut labore et dolore magna aliqua.&nbsp;</li><li>Ut enim ad minim veniam,&nbsp;</li><li>quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.&nbsp;</li></ul><div><a href="https://www.google.com/">Duis aute irure dolor in reprehenderit</a></div>')
    end
  end
end

def generate_crypto_ratings(cryptos, marius)
  CryptoRating.destroy_all

  cryptos.each do |c|
    rand(1..3).times do
      CryptoRating.create!(user: marius, crypto: c, rating: rand(2..5))
    end
  end
end

def generate_posts(array)
  content = [
    "Why are DeFi protocols so important for the crypto industry?",
    "Who is Satisho satoshi nakamoto?",
    "Tokenomics! My overview on why tokenomics should not be forgotten when launching a crypto currency",
    "My reasons why Bitcoin is the only blockchain that needs to exits",
    "ETH 2.0 why is it important and how can we as traders benefit?",
    "The Metaverse, and my cryptos I am keeping an eye one ;)"
  ]
  20.times do
    Post.create!(user: array.sample, title: content.sample, content_trix: '<div>Lorem ipsum dolor sit amet,&nbsp;<strong>consectetur adipiscing elit,</strong>&nbsp;<em>sed do eiusmod tempor incididunt</em>&nbsp;</div><ul><li>ut labore et dolore magna aliqua.&nbsp;</li><li>Ut enim ad minim veniam,&nbsp;</li><li>quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.&nbsp;</li></ul><div><a href="https://www.google.com/">Duis aute irure dolor in reprehenderit</a></div>' )
  end
end

def generate_post_comments(posts, array)
  posts.each do |p|
    rand(1..15).times do
      PostComment.create!(user: array.sample, post: p, content_trix: '<div>Lorem ipsum dolor sit amet,&nbsp;<strong>consectetur adipiscing elit,</strong>&nbsp;<em>sed do eiusmod tempor incididunt</em>&nbsp;</div><ul><li>ut labore et dolore magna aliqua.&nbsp;</li><li>Ut enim ad minim veniam,&nbsp;</li><li>quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.&nbsp;</li></ul><div><a href="https://www.google.com/">Duis aute irure dolor in reprehenderit</a></div>')
    end
  end
end

def generate_post_votes(posts, array)
  PostVote.destroy_all

  posts.each do |p|
    rand(2..50).times do
      PostVote.create!(user: array.sample, post: p, upvote: [1, 1, 1, -1].sample)
    end
  end
end

def generate_crypto_bookmarks(cryptos, array)
  cryptos.last(50).each do |c|
    CryptoBookmark.create!(user: array.sample, crypto: c)
  end
end

def generate_post_bookmarks(posts, array)
  posts.each do |p|
    PostBookmark.create!(user: array.sample, post: p)
  end
end


# main seeds
CryptoComment.destroy_all
PostComment.destroy_all
CryptoRating.destroy_all
PostVote.destroy_all
CryptoBookmark.destroy_all
PostBookmark.destroy_all
Post.destroy_all
Membership.destroy_all
Squad.destroy_all
User.destroy_all

marius = User.new(email: "marius@hotmail.com", username: "Marius", password: "marius", admin: true)
mantas = User.new(email: "mantas@hotmail.com", username: "Mantas", password: "mantas", admin: true)
tan = User.new(email: "tan@hotmail.com", username: "Tan", password: "tantan", admin: true)
tom = User.new(email: "tom@hotmail.com", username: "TOM", password: "tomtom", admin: true)

marius.photo.attach(io: URI.open("http://res.cloudinary.com/dqiadt7pm/image/upload/v1661782386/hjqrltjashi2omdr2wbw.jpg"), filename: "marius.jpg", content_type: "image/jpg")
tan.photo.attach(io: URI.open("http://res.cloudinary.com/dqiadt7pm/image/upload/v1661783149/hq4mhosbe1gjr0y4yunz.jpg"), filename: "tan.jpg", content_type: "image/jpg")
mantas.photo.attach(io: URI.open("http://res.cloudinary.com/dqiadt7pm/image/upload/v1661783176/il31crrwnmf4sdvqukwo.png"), filename: "mantas.png", content_type: "image/png")
tom.photo.attach(io: URI.open("http://res.cloudinary.com/dqiadt7pm/image/upload/v1662040477/s1raxphptwbmb4vbfzpb.jpg"), filename: "tom.jpg", content_type: "image/jpg")

users_array = [marius, tan, mantas, tom]
marius.save!
tan.save!
mantas.save!
puts "created users"

generate_posts(users_array)
puts "created posts"

posts = Post.all
generate_post_comments(posts, users_array)
puts "created post comments"

generate_post_votes(posts, users_array)
puts "created post votes"

generate_post_bookmarks(posts, users_array)
puts "created post bookmarks"

download_cryptos
puts "created cryptos"

cryptos = Crypto.all
generate_crypto_comments(cryptos, marius)
puts "created cryptos comments"

generate_crypto_ratings(cryptos, marius)
puts "created cryptos ratings"

generate_crypto_bookmarks(cryptos, users_array)
puts "created crypto bookmarks"

puts "creating squads"
c_t = Chatroom.create
c_m = Chatroom.create

t = Squad.create(title: "Ssup hoe", description: "BTC 100,000", user: tan, chatroom: c_t)
puts "yas"
m = Squad.create(title: "E-money", description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
", user: mantas, chatroom: c_m)

puts "populating squads"

Membership.create(squad: t, user: tan)
Membership.create(squad: t, user: marius)
Membership.create(squad: t, user: mantas)
Membership.create(squad: m, user: mantas)
