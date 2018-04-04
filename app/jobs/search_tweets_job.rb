class SearchTweetsJob < ApplicationJob
  queue_as :default

  def perform(*args)
  	begin
  		last_tweet = Tweet.all.sort_by(&:created_at).last
	    if last_tweet.present?
			tweets = $twitter_client.search("#cricket -rt", since_id: last_tweet.twitter_id, count: 10)
	    else
	    	tweets = $twitter_client.search("#cricket -rt", count: 10)
	    end
	    tweet_results = tweets.as_json.map{|x| {text: x['text'], profile_image: x['user']['profile_image_url'], twitter_id: x['id_str'], source: x['entities']['urls'][0].present? ? x['entities']['urls'][0]['expanded_url'] : ''}}
	    tweet_results = Tweet.create(tweet_results)
	    ActionCable.server.broadcast('tweets', {tweets: tweet_results})
	    SearchTweetsJob.set(wait: 1.minutes).perform_later
	rescue Exception => ex
		puts ex
	end
  end
end
