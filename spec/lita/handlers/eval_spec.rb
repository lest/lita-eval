require 'spec_helper'

describe Lita::Handlers::Eval, lita_handler: true do
  it 'evaluates the code' do
    stub_request(:put, 'http://tryruby.org/levels/1/challenges/0/play')
      .with(body: {cmd: '2 + 2'})
      .to_return(status: 200, body: MultiJson.dump(output: '4'))
    send_command('eval 2 + 2')
    expect(replies.last).to eq('4')
  end
end
