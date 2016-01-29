require "./twitter-raffle/*"
require "twitter-crystal/twitter"
require "yaml"
require "json"

TWITTER_VARS = YAML.load(File.read(".env.yml")) as Hash

module Twitter::Raffle
  class Statuses
    JSON.mapping({
      statuses: {type: Array(Twitter::Tweet)}
    })
  end

  class FinderOfWinners
    def initialize(@hashtag); end

    def winner
      tweets_with_hashtag.uniq.sample
    end

    private def tweets_with_hashtag
      response = client.get("/1.1/search/tweets.json", { "q" => "##{@hashtag}", "count" => "100" })
      Statuses.from_json(response).statuses.reject{|tweet| tweet.retweeted_status}.map &.user.not_nil!.name
    end

    private def client
      @client ||= Twitter::REST::Client.new(TWITTER_VARS["CK"].to_s, TWITTER_VARS["CS"].to_s, TWITTER_VARS["AT"].to_s, TWITTER_VARS["AS"].to_s)
    end
  end
end
