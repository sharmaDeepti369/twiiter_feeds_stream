$twitter_client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "4BF0ilDdX0Z6SVmFTkHB3xJnI"
  config.consumer_secret     = "ASeCsxNkY2pDDMdZ9P4qgXqKLE0iImh8vUZ3Ml5UaVX3P2u8xT"
  config.access_token        = "3287389740-vIZYR8Wx48PFi67S0fixjs62nI9LAbRDYeBhbys"
  config.access_token_secret = "xGykmbqkSAZlkl7HEhbHOx3ftP9EzVd9n1sNCrIFsA3en"
end

############### Scheduling job for searching tweets ###############

SearchTweetsJob.set(wait: 1.minute).perform_later