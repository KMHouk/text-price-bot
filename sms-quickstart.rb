require 'twilio-ruby'
require 'sinatra'
require 'blockchain'

get '/' do
  ticker = Blockchain::get_ticker()
  twiml = Twilio::TwiML::Response.new do |r|
    text = params[:Body]
    if "USD".casecmp(text) == 0
      r.Message ticker["USD"].last + ticker["USD"].symbol
    elsif "JPY".casecmp(text) == 0
      r.Message ticker["JPY"].last
    elsif "CNY".casecmp(text) == 0
      r.Message ticker["CNY"].last
    elsif "SGD".casecmp(text) == 0
      r.Message ticker["SGD"].last
    elsif "HKD".casecmp(text) == 0
      r.Message ticker["HKD"].last
    elsif "CAD".casecmp(text) == 0
      r.Message ticker["CAD"].last
    elsif "NZD".casecmp(text) == 0
      r.Message ticker["NZD"].last
    elsif "AUD".casecmp(text) == 0
      r.Message ticker["AUD"].last
    elsif "CLP".casecmp(text) == 0
      r.Message ticker["CLP"].last
    elsif "GBP".casecmp(text) == 0
      r.Message ticker["GBP"].last
    elsif "DKK".casecmp(text) == 0
      r.Message ticker["DKK"].last
    elsif "SEK".casecmp(text) == 0
      r.Message ticker["SEK"].last
    elsif "ISK".casecmp(text) == 0
      r.Message ticker["ISK"].last
    elsif "CHF".casecmp(text) == 0
      r.Message ticker["CHF"].last
    elsif "BRL".casecmp(text) == 0
      r.Message ticker["BRL"].last
    elsif "EUR".casecmp(text) == 0
      r.Message ticker["EUR"].last
    elsif "RUB".casecmp(text) == 0
      r.Message ticker["RUB"].last
    elsif "PLN".casecmp(text) == 0
      r.Message ticker["PLN"].last
    elsif "PLN".casecmp(text) == 0
      r.Message ticker["PLN"].last
    elsif "THB".casecmp(text) == 0
      r.Message ticker["THB"].last
    elsif "KRW".casecmp(text) == 0
      r.Message ticker["KRW"].last
    elsif "TWD".casecmp(text) == 0
      r.Message ticker["TWD"].last

    else
      r.Message "Please just send the 3 letter currency code."
    end
  end
  twiml.text
end
