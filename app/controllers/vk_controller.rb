require 'net/http'
require 'net/https'
class VkController < ApplicationController
	def root
		@code = params[:code]
		url = URI.parse( 'https://oauth.vk.com/access_token?' +
			'client_id=3759886&' +
			'client_secret=mC1kSquMc1Rl9i66VguW&' +
			'code=' + @code + '&' +
			'redirect_uri=http://sharinator-web-ui.herokuapp.com/vk')
		http = Net::HTTP.new( url.host, 443 )
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE

		res, data = http.get( url.to_s )
		@code += url.to_s
		@resp = res.body
	end
end
