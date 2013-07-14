require 'net/http'
require 'net/https'
require 'json'
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

		@resp1 = res.body
		jsonRes = JSON.parse res.body

		url = URI.parse( 'http://shariserver.herokuapp.com/vk?access_token=' +
		"#{jsonRes[:access_token]}&user_id=#{jsonRes[:user_id]}&expires_in=#{jsonRes[:expires_in]}")

		http = Net::HTTP.new( url.host, url.port )
		res = http.get( url.to_s )
		@code += url.to_s
		@resp2 = res.body
	end
end
