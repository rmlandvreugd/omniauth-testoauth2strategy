require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class TestOAuth2Strategy < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'https://testoauth2provider.heroku.com',
        :authorize_url => 'https://testoauth2provider.heroku.com/oauth2/authorize',
        :token_url => 'https://testoauth2provider.heroku.com/oauth2/token'
      }

      uid { raw_info['id'] }

      info do
        {
          'email' => raw_info['email'],
        }
      end

      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get('/me').body)
      end
    end
  end
end