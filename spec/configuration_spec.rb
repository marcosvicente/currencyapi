# frozen_string_literal: true
require 'currencyapi'

RSpec.describe Currencyapi::Configuration do 

  let(:token) { 'a97d808e77b51653df429b6f9eecf90e3034d6ae35393509fefa5c202bfeb8f9' }

  before do 
    Currencyapi::Configuration.token = token
  end

  it '.token' do 
    expect(Currencyapi::Configuration.token).to eq(token)
  end

  it '.get_endpoint' do 
    expect(Currencyapi::Configuration.get_endpoint).to eq("https://api.currencyapi.com/v3")
  end
end