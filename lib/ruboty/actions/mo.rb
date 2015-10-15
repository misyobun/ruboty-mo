require "ruboty/mo/version"
require "faraday"
require 'faraday_middleware/parse_oj'

module Ruboty
  module Mo
    module Actions
      class Mo < Ruboty::Actions::Base
        def call
          message.reply(mo)
        end

        def mo
          last_price = fetch_rate_of_yen_against_mona
          "現在のレートは1モナ#{last_price}円です"
        end

        def fetch_rate_of_yen_against_mona
          conn = Faraday.new(:url => 'https://exchange.etwings.com') do |builder|
            builder.response :oj
            builder.adapter Faraday.default_adapter
          end
          res = conn.get '/api/1/last_price/mona_jpy'
          raise "etwings API error" if res.status != 200
          last_price = res.body['last_price']
        end
      end
    end
  end
end
