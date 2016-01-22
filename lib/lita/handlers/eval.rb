require 'lita'

module Lita
  module Handlers
    class Eval < Handler
      route %r{\Aeval\s(.+)}i, :evaluate, command: true, help: {
        'eval CODE' => 'Evaluates the given ruby code.'
      }

      def evaluate(response)
        code = response.matches[0][0]
        http_response = http.put 'http://tryruby.org/levels/1/challenges/0/play' do |req|
          req.body = {cmd: code}
        end
        response.reply MultiJson.load(http_response.body)['output']
      end
    end

    Lita.register_handler(Eval)
  end
end
