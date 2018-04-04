module ApplicationCable
  class Connection < ActionCable::Connection::Base
	identified_by :current_user

    def connect
      # self.current_tweet = find_current_tweet
    end

  end
end
