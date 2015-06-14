require 'lita'

module Lita
  module Handlers
    class Eval < Handler
      route %r{\Aeval\s(.+)}i, :evaluate, command: true, help: {
        'eval CODE' => 'Evaluates the given ruby code.'
      }

      def evaluate(response)
        code = response.matches[0][0]
        http_response = http.post 'http://eval.so/api/evaluate' do |req|
          req.headers['Content-Type'] = 'application/json'
          req.body = MultiJson.dump(language: 'ruby', code: "p(#{code})")
        end
        response.reply MultiJson.load(http_response.body)['stdout'].strip
      end
    end

    Lita.register_handler(Eval)
  end
end
