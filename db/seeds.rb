require "open-uri"
require "json"

#methods called below
def download_cryptos
  Crypto.destroy_all
  UpdateCryptosJob.perform_now
end

def generate_crypto_comments(cryptos, array)
  cryptos.each do |c|
    rand(1..3).times do
      crypto = CryptoComment.create!(user: array.sample, crypto: c, content_trix: '<div>Lorem ipsum dolor sit amet,&nbsp;<strong>consectetur adipiscing elit,</strong>&nbsp;<em>sed do eiusmod tempor incididunt</em>&nbsp;</div><ul><li>ut labore et dolore magna aliqua.&nbsp;</li><li>Ut enim ad minim veniam,&nbsp;</li><li>quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.&nbsp;</li></ul><div><a href="https://www.google.com/">Duis aute irure dolor in reprehenderit</a></div>')
      rand(0..2).times { CryptoNestedComment.create!(user: array.sample, crypto_comment: crypto, content_trix: '<div>Lorem ipsum dolor sit amet,&nbsp;<strong>consectetur adipiscing elit,</strong>&nbsp;<em>sed do eiusmod tempor incididunt</em>&nbsp;</div>') }
    end
  end
end

def generate_crypto_ratings(cryptos, array)
  CryptoRating.destroy_all

  cryptos.each do |c|
    array.each do |u|
      CryptoRating.create!(user: u, crypto: c, rating: rand(2..5))
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
    Post.create!(user: array.sample, title: content.sample, content_trix: "<div><strong>Lorem ipsum dolor sit amet</strong>, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><br><br><strong>Lorem ipsum dolor sit amet, consectetur adipiscing elit, </strong>sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><br><br>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation:</div><ul><li>ullamco laboris nisi ut aliquip ex ea commodo consequat</li><li>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat </li><li>nulla pariatur. Excepteur sint occaecat cupidatat non proident, </li><li>sunt in culpa qui officia deserunt mollit anim id est laborum.</li></ul><div><br><strong>Lorem ipsum dolor sit amet, consectetur adipiscing elit</strong></div>")
  end
end

def generate_post_comments(posts, array)
  posts.each do |p|
    rand(1..7).times do
      post = PostComment.create!(user: array.sample, post: p, content_trix: '<div>Lorem ipsum dolor sit amet,&nbsp;<strong>consectetur adipiscing elit,</strong>&nbsp;<em>sed do eiusmod tempor incididunt</em>&nbsp;</div><ul><li>ut labore et dolore magna aliqua.&nbsp;</li><li>Ut enim ad minim veniam,&nbsp;</li><li>quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.&nbsp;</li></ul><div><a href="https://www.google.com/">Duis aute irure dolor in reprehenderit</a></div>')
      rand(0..3).times { PostNestedComment.create!(user: array.sample, post_comment: post, content_trix: '<div>Lorem ipsum dolor sit amet,&nbsp;<strong>consectetur adipiscing elit,</strong>&nbsp;<em>sed do eiusmod tempor incididunt</em>&nbsp;</div>') }
    end
  end
end

def generate_post_votes(posts, array)
  PostVote.destroy_all

  posts.each do |p|
    array.each do |u|
      PostVote.create!(user: u, post: p, upvote: [1, 1, 1, -1].sample)
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
CryptoNestedComment.destroy_all
CryptoComment.destroy_all
PostNestedComment.destroy_all
PostComment.destroy_all
CryptoRating.destroy_all
PostVote.destroy_all
CryptoBookmark.destroy_all
PostBookmark.destroy_all
Post.destroy_all
Watching.destroy_all
Watchlist.destroy_all
Membership.destroy_all
Squad.destroy_all
User.destroy_all
puts "Deleted all data in DB"


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
generate_crypto_comments(cryptos, users_array)
puts "created cryptos comments"

generate_crypto_ratings(cryptos, users_array)
puts "created cryptos ratings"

generate_crypto_bookmarks(cryptos, users_array)
puts "created crypto bookmarks"

puts "creating squads"
c_t = Chatroom.create()
c_m = Chatroom.create()
c_marius =Chatroom.create()

puts "chatroom"
puts c_t.id

w1 = Watchlist.create();
w2 = Watchlist.create();
w3 = Watchlist.create();


t = Squad.new(title: "Next DeFi Season, let's prepare", description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).", user: tan)
m = Squad.new(title: "The Metaverse, let's find a top 10!", description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).", user: mantas)
mar = Squad.new(title: "Microcap Research Group", description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).", user: mantas);


t.chatroom = c_t
m.chatroom = c_m
mar.chatroom = c_marius

t.watchlist = w1;
m.watchlist = w2
mar.watchlist = w3

t.save
m.save
mar.save

w1.squad = t
w1.save
w2.squad = m
w2.save
w3.squad = mar
w3.save

puts"watchlist"
puts w1.id

puts"sq"
puts t.id

Watching.create!(watchlist: t.watchlist, crypto_id: 2)
Watching.create!(watchlist: t.watchlist, crypto_id: 6)
Watching.create!(watchlist: t.watchlist, crypto_id: 5)
Watching.create!(watchlist: t.watchlist, crypto_id: 1)
Watching.create!(watchlist: t.watchlist, crypto_id: 11)
Watching.create!(watchlist: t.watchlist, crypto_id: 13)

Watching.create!(watchlist: m.watchlist, crypto_id: 6)
Watching.create!(watchlist: m.watchlist, crypto_id: 4)
Watching.create!(watchlist: m.watchlist, crypto_id: 2)
Watching.create!(watchlist: m.watchlist, crypto_id: 1)
Watching.create!(watchlist: m.watchlist, crypto_id: 9)

Watching.create!(watchlist: mar.watchlist, crypto_id: 6)
Watching.create!(watchlist: mar.watchlist, crypto_id: 4)
Watching.create!(watchlist: mar.watchlist, crypto_id: 2)
Watching.create!(watchlist: mar.watchlist, crypto_id: 1)
Watching.create!(watchlist: mar.watchlist, crypto_id: 9)

puts "populating squads"

Membership.create!(squad: t, user: tan)
Membership.create!(squad: t, user: marius)
Membership.create!(squad: t, user: mantas)
Membership.create!(squad: m, user: mantas)
