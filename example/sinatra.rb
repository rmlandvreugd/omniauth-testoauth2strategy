require 'rubygems'
require 'bundler'

Bundler.setup :default, :development, :example
require 'sinatra'
require 'omniauth'
require 'omniauth-testoauth2strategy'

use Rack::Session::Cookie

use OmniAuth::Builder do
  provider :testoauth2strategy, "f592ee9096e25560e5cd7f2522713690", "9bf4cc4d94fba9fbb048aa0e3e2067cd"
end

get '/' do
  <<-HTML
<ul>
<li><a href='/auth/testoauth2strategy'>Sign in with TestOAuth2Strategy</a></li>
</ul>
HTML
end

get '/auth/:provider/callback' do
  content_type 'text/plain'
  request.env['omniauth.auth'].info.to_hash.inspect
end