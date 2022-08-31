$redis = Redis.new

url = ENV["REDISCLOUD_URL"]

if url
  Sidekiq.configure_server do |config|
    config.redis = { url: url }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: url }
  end
  $redis = Redis.new(:url => url)
end
# Procfile
web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -C config/sidekiq.yml


=begin
Then you must:

Commit
Deploy
Go to Heroku Dashboard to set dynos, or with the CLI:
heroku ps:scale worker=1
heroku ps # Check worker dyno is running
SIDEKIQ WEB
Run the migrations in prod:

heroku run rails db:migrate
Launch heroku run rails c and create a new admin user:

User.create(email: "seb@lewagon.org", password: "password", admin: true)
Sign in as an admin and visit /sidekiq to access Sidekiq web console 🎉

HEROKU CRON JOBS
You can use Heroku Scheduler add-on to run jobs at scheduled time intervals



EXTRA RESOURCES
The full source code of the lecture is available on GitHub

HAPPY ASYNCHRONIZING!
=end
