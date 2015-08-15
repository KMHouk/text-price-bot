require 'twilio-ruby'
require 'sinatra'
require 'blockchain'

get '/' do
  ticker = Blockchain::get_ticker()
  twiml = Twilio::TwiML::Response.new do |r|
    text = params[:Body]
    if "USD".casecmp(text) == 0
      r.Message ticker["USD"].last
    elsif "JPY".casecmp(text) == 0
      r.Message ticker["JPY"].last
    else
      r.Message "Please just send the 3 letter currency code."
    end
  end
  twiml.text
end
