require 'lita'
require 'sicuro'

module Lita
  module Handlers
    class Eval < Handler
      route %r{\Aeval\s(.+)}i, :evaluate, command: true, help: { 
        'eval CODE' => 'Evaluates the given ruby code.'
      }

      def evaluate(response)
        code = response.matches[0][0]
        response.reply Sicuro.new(256, 256 * 32).eval("p(#{code})").to_s.strip
      rescue
        response.reply 'Sorry, I was unable to evaluate the given code.'
      end
    end

    Lita.register_handler(Eval)
  end
end
