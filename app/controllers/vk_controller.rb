class VkController < ApplicationController
	def root
		@code = params[:code];
	end
end
