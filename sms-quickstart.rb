require 'twilio-ruby'
require 'sinatra'
require 'blockchain'

get '/' do
  ticker = Blockchain::get_ticker()
  twiml = Twilio::TwiML::Response.new do |r|
    r.Message ticker[params[:Body]].last
    # r.Message "Hey Monkey. Thanks for the message!"
  end
  twiml.text
end
