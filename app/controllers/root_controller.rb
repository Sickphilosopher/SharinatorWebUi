class RootController < ApplicationController
	def root
		@hostname = request.host || "sui"
		respond_to do |format|
			format.html
			format.js
		end
	end
end
