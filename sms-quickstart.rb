require 'twilio-ruby'
require 'sinatra'
require 'blockchain'

get '/' do
  ticker = Blockchain::get_ticker()
  twiml = Twilio::TwiML::Response.new do |r|
    text = params[:Body]
    case text
    when "USD" || "usd"
      r.Message ticker["USD"].last
    when "JPY" || "jpy"
      r.Message ticker["JPY"].
    else
      r.Message "Please just send the 3 letter currency code."
  end
  twiml.text
end
