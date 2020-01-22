# frozen_string_literal: true

require './cipher_string'

RSpec.describe 'caesar cipher method' do
  it 'shifts letters' do
    expect(caesar_cipher('abcdef', 1)).to eql('bcdefg')
  end

  it 'shifts negative numbers' do
    expect(caesar_cipher('deutschland', -5)).to eql('yzponxcgviy')
  end

  it 'go back to start, after 26' do
    expect(caesar_cipher('deutschland', 27)).to eql('efvutdimboe')
  end

  it 'can cypher more than one string' do
    expect(caesar_cipher('deutschland und mexiko sind schön!', -5)).to eql('yzponxcgviy piy hzsdfj ndiy nxcöi!')
  end
end
