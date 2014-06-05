require 'sinatra'
require 'sinatra/json'
require 'json'
require 'open-uri'

get '/' do
  "Welcome to the Rapportive API demo!
  <br><br>
  Usage: <a href='/api/v1/rapportive/luizfaias@gmail.com'>/api/v1/rapportive/user@email.com</a>"
end

get '/api/v1/rapportive/:email' do
  json call_api params[:email]
end

# Sends a query to the undocumented Rapportive API
# return json object if valid email
def call_api(email)
  status_url = 'https://rapportive.com/login_status?user_email=' + email
  profile_url = 'https://profiles.rapportive.com/contacts/email/' + email

  # exponential backoff to get session_token
  response = exp_backoff 2, status_url
  session_token = response['session_token'] if response

  if response.nil? || response['error']
    false
  elsif response['status'] == 200 && session_token
    header = { 'X-Session-Token' => session_token }

    response = exp_backoff 2, profile_url, header
    if response.nil?
      false
    elsif response['success'] != 'nothing_useful'
      response['contact']
    end
  end
end

# Exponential Backoff when visiting a URL
def exp_backoff(up_to, url, header = {})
  tries = 0
  begin
    tries += 1
    response = JSON.parse(open(url, header).read)
  rescue OpenURI::HTTPError
    if tries < up_to
      sleep( 2 ** tries )
      retry
    end
  end
end