require 'twilio-ruby'
require 'sinatra'
require 'blockchain'

get '/' do
  ticker = Blockchain::get_ticker()
  twiml = Twilio::TwiML::Response.new do |r|
    text = params[:Body]
    if "USD".casecmp(text) == 0
      r.Message "#{ticker["USD"].symbol}#{ticker["USD"].last}"
    elsif "JPY".casecmp(text) == 0
      r.Message "#{ticker["JPY"].symbol}#{ticker["JPY"].last}"
    elsif "CNY".casecmp(text) == 0
      r.Message "#{ticker["CNY"].symbol}#{ticker["CNY"].last}"
    elsif "SGD".casecmp(text) == 0
      r.Message "#{ticker["SGD"].symbol}#{ticker["SGD"].last}"
    elsif "HKD".casecmp(text) == 0
      r.Message "#{ticker["HKD"].symbol}#{ticker["HKD"].last}"
    elsif "CAD".casecmp(text) == 0
      r.Message "#{ticker["CAD"].symbol}#{ticker["CAD"].last}"
    elsif "NZD".casecmp(text) == 0
      r.Message "#{ticker["NZD"].symbol}#{ticker["NZD"].last}"
    elsif "AUD".casecmp(text) == 0
      r.Message "#{ticker["AUD"].symbol}#{ticker["AUD"].last}"
    elsif "CLP".casecmp(text) == 0
      r.Message "#{ticker["CLP"].symbol}#{ticker["CLP"].last}"
    elsif "GBP".casecmp(text) == 0
      r.Message "#{ticker["GBP"].symbol}#{ticker["GBP"].last}"
    elsif "DKK".casecmp(text) == 0
      r.Message "#{ticker["DKK"].symbol}#{ticker["DKK"].last}"
    elsif "SEK".casecmp(text) == 0
      r.Message "#{ticker["SEK"].symbol}#{ticker["SEK"].last}"
    elsif "ISK".casecmp(text) == 0
      r.Message "#{ticker["ISK"].symbol}#{ticker["ISK"].last}"
    elsif "CHF".casecmp(text) == 0
      r.Message "#{ticker["CHF"].symbol}#{ticker["CHF"].last}"
    elsif "BRL".casecmp(text) == 0
      r.Message "#{ticker["BRL"].symbol}#{ticker["BRL"].last}"
    elsif "EUR".casecmp(text) == 0
      r.Message "#{ticker["EUR"].symbol}#{ticker["EUR"].last}"
    elsif "RUB".casecmp(text) == 0
      r.Message "#{ticker["RUB"].symbol}#{ticker["RUB"].last}"
    elsif "PLN".casecmp(text) == 0
      r.Message "#{ticker["PLN"].symbol}#{ticker["PLN"].last}"
    elsif "THB".casecmp(text) == 0
      r.Message "#{ticker["THB"].symbol}#{ticker["THB"].last}"
    elsif "KRW".casecmp(text) == 0
      r.Message "#{ticker["KRW"].symbol}#{ticker["KRW"].last}"
    elsif "TWD".casecmp(text) == 0
      r.Message "#{ticker["TWD"].symbol}#{ticker["TWD"].last}"

    else
      r.Message "Please just send the 3 letter currency code."
    end
  end
  twiml.text
end
