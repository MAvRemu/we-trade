web: bin/rails server -p 3000
js: yarn build --watch

web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -C config/sidekiq.yml
