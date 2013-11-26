require 'spec_helper'

describe Lita::Handlers::Eval, lita_handler: true do
  it 'evaluates the code' do
    send_command('eval 2 + 2')
    expect(replies.last).to eq('4')
  end
end
