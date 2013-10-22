require 'net/http'
require 'net/https'
require 'json'
class VkController < ApplicationController
	def root
		@code = params[:code]
		@hostname = request.host || "sui"

		url = URI.parse( 'https://oauth.vk.com/access_token?' +
			'client_id=3759886&' +
			'client_secret=mC1kSquMc1Rl9i66VguW&' +
			"code=#{@code}&" +
			"redirect_uri=#{@hostname}/vk" )

		http = Net::HTTP.new( url.host, 443 )
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE

		begin
			res, data = http.get( url.to_s )

			@resp1 = res.body
			jsonRes = JSON.parse res.body

			if( jsonRes['access_token'] != nil )
				redirect_to action: 'ok'
			else
				redirect_to action: 'error'
			end
		rescue
			redirect_to action: 'error'
		end

	end

	def ok
		render :nothing => true, :status => 200, :content_type => 'text/html'
	end

	def error
		render :nothing => true, :status => 200, :content_type => 'text/html'
	end
end
