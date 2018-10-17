# config/initializers/pusher.rb
require 'pusher'

Pusher.app_id = '624569'
Pusher.key = '88d92ad5597d2ebdbc7e'
Pusher.secret = '3c36ba1f24631d0e99ae'
Pusher.cluster = 'eu'
Pusher.logger = Rails.logger
Pusher.encrypted = true
