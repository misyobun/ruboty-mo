require "ruboty/mo/version"
require "ruboty/actions/mo"

module Ruboty
  module Handlers
    class Mo < Base
        on /mona-jpy\z/i ,name:'mo',description: 'command for mona_jpy'

      def mo(message)
        Ruboty::Mo::Actions::Mo.new(message).call
      end
    end
  end
end
