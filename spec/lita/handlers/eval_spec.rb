require 'spec_helper'

describe Lita::Handlers::Eval, lita_handler: true do
  it 'evaluates the code' do
    stub_request(:post, 'http://eval.so/api/evaluate')
      .with(body: MultiJson.dump(language: 'ruby', code: 'p(2 + 2)'))
      .to_return(status: 200, body: MultiJson.dump(stdout: "4\n"))
    send_command('eval 2 + 2')
    expect(replies.last).to eq('4')
  end
end
