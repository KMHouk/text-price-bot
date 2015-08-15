require 'twilio-ruby'
require 'sinatra'
require 'blockchain'

get '/' do
  ticker = Blockchain::get_ticker()
  twiml = Twilio::TwiML::Response.new do |r|
    text = params[:Body].upcase
    if text.length == 3
      r.Message "#{ticker[text].symbol}#{ticker[text].last}"
    elsif text.match(" ")
      space = text.index(" ")
      r.Message "#{Blockchain::to_btc(text[space+1..-1)], text[0..space-1])}"
    else
      r.Message "Error"
  end
  twiml.text
end
