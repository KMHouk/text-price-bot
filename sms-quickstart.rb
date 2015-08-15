require 'twilio-ruby'
require 'sinatra'
require 'blockchain'

get '/' do
  ticker = Blockchain::get_ticker()
  twiml = Twilio::TwiML::Response.new do |r|
    begin
    text = params[:Body].upcase
    if text.length == 3
      r.Message "#{ticker[text].last} #{text}"
    elsif text.match(" ")
      space = text.index(" ")
      r.Message "#{Blockchain::to_btc(text[space+1..-1], text[0..space-1])} BTC"
    else
      r.Message "Please text the 3 letter currency code for the latest price (ex: 'usd') OR text the currency value, space, 3 letter currency code (ex: '100 usd')"
    end
  rescue
    r.Message "Unrecognized input caused exception."
  end
  end
  twiml.text
end
