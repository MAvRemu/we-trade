require "open-uri"
require "json"

#methods called below
def download_cryptos
  Crypto.destroy_all
  UpdateCryptosJob.perform_now
end

def generate_crypto_comments(cryptos, array)
  cryptos.each do |c|

    if c.name.downcase == "polygon"
      crypto = CryptoComment.create!(user: array[0], crypto: c, content_trix: "<div class=\"trix-content\">\n  <div><strong>What is Polygon (MATIC)?</strong></div><div>Formerly known as Matic Network, Polygon is an Ethereum layer 2 scaling solution that provides the framework for building and connecting Ethereum-compatible blockchain networks.<br><br>\n</div><div>Polygon (MATCI) calls itself \"Ethereum's internet of blockchains\" as it builds a multi-chain ecosystem that combines the best of Ethereum with other compatible chains. <br><br>\n</div><div>Enabling them to enjoy the security and network effect of Ethereum while avoiding all the known problems of slow speeds and high gas fees.<br><br>\n</div><div>Polygon uses a POS (proof of stake) algorithm that helps it scale up to a maximum of 7000 transactions per second (TPS) with 2-second block confirmation times and a $0.00004 average transaction fee. <br><br>\n</div><div>Making it one of the fastest and cheapest chains while still maintaining Ethereum-level security and decentralization. <br><br>\n</div><div><strong>Polygon (MATIC) fast facts</strong></div><ul>\n<li>Polygon (MATIC) is a network of independent blockchains connected to Ethereum.</li>\n<li>Polygon (MATIC) can process up to a maximum of 7,000 transactions per second.</li>\n<li>The project was formerly called Matic Network but was rebranded to Polygon in February 2021.</li>\n<li>Currently, about 200 different dApps are plugged into Polygon, providing their uses with faster and cheaper transactions with the security and decentralization of Ethereum.</li>\n<li>Year-to-date (YTD) Polygone native token - MATIC- has appreciated by over 6000%+ and most of that growth came with the 2021 bull run.</li>\n<li>The <a href=\"https://wallet.matic.network/bridge/\">polygon bridge</a> makes it easy, safe, and fast to move funds across chains.</li>\n<li>Polygon is an open-source project that's being built and developed by a decentralized team of contributors.</li>\n</ul>\n</div>\n")
      CryptoNestedComment.create!(user: array[2], crypto_comment: crypto, content_trix: "<div class=\"trix-content\">\n  <div>I love this. clearly outlined fundamentals! I myself, I've got a personal bag of some MATIC I'm very happy with. The polygon project actually seems to have quite solid grounds. Bullish! :)<br><br>\n</div><div>You've got thoughts on Solana?</div></div>" )
      CryptoNestedComment.create!(user: array[3], crypto_comment: crypto, content_trix: "<div class=\"trix-content\">\n  <div>Thanks, great post!<br><br>\n</div><div>And so far Polygon, it has done exceptionally well. with over 400 dApps currently running on its blockchain, more than $9 billion of TVL, and millions of active monthly users. Thus Establishing itself as one of the most prominent smart contract platforms for all things DeFi.<br><br>\n</div><div>Let's see what the future holds :)</div>\n</div>\n" )
      puts "polygon"
    elsif c.name.downcase == "ethereum"
      crypto = CryptoComment.create!(user: array[2], crypto: c, content_trix: "<div class=\"trix-content\">\n  <div><strong>Ethereum’s “Merge” is about to put every ether miner out of work</strong></div><div>\n<br>In a few weeks, Ethereum is slated to undergo the most significant change in its seven-year history. Until now, the Ethereum blockchain has been secured using a method called \"proof-of-work,\" which consumes more electricity than the entire nation of Belgium. Next month's switch to a new method called \"proof-of-stake\" is expected to cut Ethereum's energy consumption by a factor of 1,000.</div><div>\n<br>The stakes are high. A botched transition could mean chaos for the many crypto projects built on top of Ethereum. A smooth transition would be the culmination of years of careful planning by Ethereum's core developers. Over the last year, developers have repeatedly pushed back the date of \"the Merge\" to give themselves more time to prepare. They <a href=\"https://www.coindesk.com/tech/2022/08/11/ethereums-third-and-final-testnet-merge-goes-live-on-goerli/\">completed a final dress rehearsal</a> on August 10, clearing the way to make the switch in mid-September.<br><br>\n</div>\n</div>\n")
      CryptoNestedComment.create!(user: array[0], crypto_comment: crypto, content_trix: "Very good comments, the merge is gonna be such a big event for the crypto industry" )
    else
      rand(1..3).times do
        crypto = CryptoComment.create!(user: array.sample, crypto: c, content_trix: '<div>Lorem ipsum dolor sit amet,&nbsp;<strong>consectetur adipiscing elit,</strong>&nbsp;<em>sed do eiusmod tempor incididunt</em>&nbsp;</div><ul><li>ut labore et dolore magna aliqua.&nbsp;</li><li>Ut enim ad minim veniam,&nbsp;</li><li>quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.&nbsp;</li></ul><div><a href="https://www.google.com/">Duis aute irure dolor in reprehenderit</a></div>')
        rand(0..2).times { CryptoNestedComment.create!(user: array.sample, crypto_comment: crypto, content_trix: '<div>Lorem ipsum dolor sit amet,&nbsp;<strong>consectetur adipiscing elit,</strong>&nbsp;<em>sed do eiusmod tempor incididunt</em>&nbsp;</div>') }
      end
    end
  end
end

def generate_crypto_ratings(cryptos, array)
  CryptoRating.destroy_all

  cryptos.each do |c|
    array.each do |u|
      if u.username.downcase == "tan" && c.name.downcase == "polygon"
        puts "tan not rating polygon"
      else
        CryptoRating.create!(user: u, crypto: c, rating: rand(2..5))
      end
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
  Post.create!(user: array[5], title: "DeFi - Building the future of Decentralised Finance", content_trix: "<div class=\"trix-content\">\n  <div>The <a href=\"https://corpgov.law.harvard.edu/2021/01/14/defi-and-the-future-of-finance/\">decentralized finance</a> (DeFi) industry started gaining steam in the summer of 2020, propelled by decentralized applications (Dapps). The sector has since managed to carve out a niche market that promises to herald a new era for financial products and services.</div><div>\n<br>The DeFi space harnesses blockchain tech’s power to facilitate robust solutions that will likely reshape the existing financial ecosystem in the future. DeFi products look well primed to eventually replace most traditional financial services, including loans, savings, insurance, and trading.<br><br>\n</div><div><strong>Why Lending in DeFi is The Future</strong></div><div>The DeFi ecosystem has grown exponentially in a relatively short period, with numerous protocols such as AAVE, Compound, and Synthetix emerging to offer users decentralized crypto lending and borrowing.<br><br>\n</div><div><strong>DeFi Introduces Democratized Finance</strong></div><div>Multiple DeFi protocols have emerged since 2015, offering alternatives to the traditional financial network. Since these platforms run entirely on smart contracts that govern automated liquidity pools, they eliminate intermediaries in the borrowing and lending process and pave the way for democratized finance.<br><br>\n</div><div><strong>Total Value Locked in DeFi Crosses $51 Billion</strong></div><div>As per data from leading DeFi rankings and analytics website <a href=\"https://defipulse.com/\">Defi Pulse</a> the total value locked in various protocols has surpassed the $51 billion mark, indicating the high appetite that exists for transparent, decentralized financial products.</div>\n</div>\n")
end

def generate_post_comments(posts, array)
  posts.each do |p|
    if p.title == "DeFi - Building the future of Decentralised Finance"
      post = PostComment.create!(user: array[4], post: p, content_trix: 'Great analysis, thanks a lot for the effort!')
      post = PostComment.create!(user: array[2], post: p, content_trix: 'So when do you actually expect that the DeFi industry will become active again?')
      PostNestedComment.create!(user: array[5], post_comment: post, content_trix: 'So you bring up an interesting point, the truth is DeFi is active discussed by the EU commision as we speak. Once these EU regulations and guidelines are clear we can definitely see some activity again')
    else
      rand(1..7).times do
        post = PostComment.create!(user: array.sample, post: p, content_trix: '<div>Lorem ipsum dolor sit amet,&nbsp;<strong>consectetur adipiscing elit,</strong>&nbsp;<em>sed do eiusmod tempor incididunt</em>&nbsp;</div><ul><li>ut labore et dolore magna aliqua.&nbsp;</li><li>Ut enim ad minim veniam,&nbsp;</li><li>quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.&nbsp;</li></ul><div><a href="https://www.google.com/">Duis aute irure dolor in reprehenderit</a></div>')
        rand(0..3).times { PostNestedComment.create!(user: array.sample, post_comment: post, content_trix: '<div>Lorem ipsum dolor sit amet,&nbsp;<strong>consectetur adipiscing elit,</strong>&nbsp;<em>sed do eiusmod tempor incididunt</em>&nbsp;</div>') }
      end
    end
  end
end

def generate_post_votes(posts, array)
  PostVote.destroy_all

  posts.each do |p|
    array.each do |u|
      PostVote.create!(user: u, post: p, upvote: [1, 1, 1, -1].sample) unless p.title == "DeFi - Building the future of Decentralised Finance" && u.username.downcase == "tan"
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
clay = User.new(email: "clay@hotmail.com", username: "clay", password: "tomtom", admin: false)
alice = User.new(email: "alice@hotmail.com", username: "alice", password: "tomtom", admin: false)
siona = User.new(email: "siona@hotmail.com", username: "siona", password: "tomtom", admin: false)
tom2 = User.new(email: "tom3@hotmail.com", username: "tom2", password: "tomtom", admin: false)

marius.photo.attach(io: URI.open("http://res.cloudinary.com/dqiadt7pm/image/upload/v1661782386/hjqrltjashi2omdr2wbw.jpg"), filename: "marius.jpg", content_type: "image/jpg")
tan.photo.attach(io: URI.open("http://res.cloudinary.com/dqiadt7pm/image/upload/v1661783149/hq4mhosbe1gjr0y4yunz.jpg"), filename: "tan.jpg", content_type: "image/jpg")
mantas.photo.attach(io: URI.open("http://res.cloudinary.com/dqiadt7pm/image/upload/v1661783176/il31crrwnmf4sdvqukwo.png"), filename: "mantas.png", content_type: "image/png")
tom.photo.attach(io: URI.open("http://res.cloudinary.com/dqiadt7pm/image/upload/v1662040477/s1raxphptwbmb4vbfzpb.jpg"), filename: "tom.jpg", content_type: "image/jpg")
clay.photo.attach(io: URI.open("http://res.cloudinary.com/dqiadt7pm/image/upload/v1662565780/unzrpbaen3zmc8orhgub.jpg"), filename: "clay.jpg", content_type: "image/jpg")
alice.photo.attach(io: URI.open("http://res.cloudinary.com/dqiadt7pm/image/upload/v1662565965/c1ke6zpwsepsvsyunmyt.jpg"), filename: "alice.jpg", content_type: "image/jpg")
siona.photo.attach(io: URI.open("http://res.cloudinary.com/dqiadt7pm/image/upload/v1662566040/i1wp6nux2imudgy8p1ux.jpg"), filename: "siona.jpg", content_type: "image/jpg")
tom2.photo.attach(io: URI.open("http://res.cloudinary.com/dqiadt7pm/image/upload/v1662566566/g3r9pgsy9fqfv2izfg8u.jpg"), filename: "tom2.jpg", content_type: "image/jpg")

users_array = [marius, tan, mantas, tom, clay, siona, tom2]
marius.save!
tan.save!
mantas.save!
clay.save!
alice.save!
siona.save!
tom2.save!
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
c_t = Chatroom.create!()
c_m = Chatroom.create!()
c_marius = Chatroom.create!()
c_s =Chatroom.create!()
c_s2 =Chatroom.create!()
c_s3 =Chatroom.create!()

puts "chatroom"
puts c_t.id

w1 = Watchlist.new();
w2 = Watchlist.new();
w3 = Watchlist.new();
w4 = Watchlist.new();
w5 = Watchlist.new();
w6 = Watchlist.new();

t = Squad.new(title: "Next DeFi Season, let's prepare", description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).", user: tan)
m = Squad.new(title: "The Metaverse, let's find a top 10!", description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).", user: mantas)
mar = Squad.new(title: "Microcap Research Group", description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).", user: mantas);
squad = Squad.new(title: "Top NFT's in 2022", description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).", user: mantas);
squad2 = Squad.new(title: "ETH2.0 & the Merge", description: "Welcome new members to the ETH2.0 squad! Through this squad I would like research with you what the merge actually is and how we can potentially benefit form it. Let's talk!", user: mantas);
squad3 = Squad.new(title: "Next LVL1 chain", description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).", user: mantas);

t.chatroom = c_t
m.chatroom = c_m
mar.chatroom = c_marius
squad.chatroom = c_s
squad2.chatroom = c_s2
squad3.chatroom = c_s3

t.watchlist = w1
m.watchlist = w2
mar.watchlist = w3
squad.watchlist = w4
squad2.watchlist = w5
squad3.watchlist = w6

t.save!
m.save!
mar.save!
squad.save!
squad2.save!
squad3.save!

w1.squad = t
w1.save!
w2.squad = m
w2.save!
w3.squad = mar
w3.save!
w4.squad = squad
w4.save!
w5.squad = squad2
w5.save!
w6.squad = squad3
w6.save!

puts"watchlist"
puts w1.id

puts"sq"
puts t.id

Watching.create!(watchlist: t.watchlist, crypto: Crypto.last(10)[1])
Watching.create!(watchlist: t.watchlist, crypto: Crypto.last(10)[2])
Watching.create!(watchlist: t.watchlist, crypto: Crypto.last(10)[3])
Watching.create!(watchlist: t.watchlist, crypto: Crypto.last(10)[4])
Watching.create!(watchlist: t.watchlist, crypto: Crypto.last(10)[5])
Watching.create!(watchlist: t.watchlist, crypto: Crypto.last(10)[6])

Watching.create!(watchlist: m.watchlist, crypto: Crypto.last(10)[7])
Watching.create!(watchlist: m.watchlist, crypto: Crypto.last(10)[8])
Watching.create!(watchlist: m.watchlist, crypto: Crypto.last(10)[9])
Watching.create!(watchlist: m.watchlist, crypto: Crypto.last(10)[1])
Watching.create!(watchlist: m.watchlist, crypto: Crypto.last(10)[2])

Watching.create!(watchlist: mar.watchlist, crypto: Crypto.last(10)[3])
Watching.create!(watchlist: mar.watchlist, crypto: Crypto.last(10)[4])
Watching.create!(watchlist: mar.watchlist, crypto: Crypto.last(10)[5])
Watching.create!(watchlist: mar.watchlist, crypto: Crypto.last(10)[6])
Watching.create!(watchlist: mar.watchlist, crypto: Crypto.last(10)[7])

puts "populating squads"

Membership.create!(squad: t, user: tan)
Membership.create!(squad: t, user: marius)
Membership.create!(squad: t, user: mantas)
Membership.create!(squad: m, user: mantas)

post = PostComment.create!(user: users_array[3], post: Post.find_by(title: "DeFi - Building the future of Decentralised Finance"), content_trix: 'You reports are the best, I am gonna upvote this one immediately')
Membership.create!(squad: squad, user: mantas)
Membership.create!(squad: squad2, user: mantas)
Membership.create!(squad: squad3, user: mantas)
Membership.create!(squad: mar, user: mantas)
