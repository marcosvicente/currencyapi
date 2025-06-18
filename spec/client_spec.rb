# frozen_string_literal: true
require 'currencyapi'

RSpec.describe Currencyapi::Client do 
  let(:token) { 'a97d808e77b51653df429b6f9eecf90e3034d6ae35393509fefa5c202bfeb8f9' }
  let(:response_convert) { get_value_from_json("convert") }
  let(:response_latest) { get_value_from_json("latest") }

  before do 
    Currencyapi::Configuration.token = token
    @client = Currencyapi::Client.new
  end

  context '.convert' do
   let(:params) do
    {
      value: 12,
      currencies: 'USD',
      base_currency: 'USB',
      date: Date.today,
      type: 'fiat'
    }
   end
   
   it "return json" do
      allow(Currencyapi::Api::Convert).to receive(:convert).with(params).and_return(:response_convert)
      expect(@client.convert(params)).to eq(response_convert)
    end
  end

   context '.latest' do 
    it "return json" do
      expect(client.latest).to eq("https://api.currencyapi.com/v3")
    end
  end
end