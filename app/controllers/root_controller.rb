class RootController < ApplicationController
	def root
		@hostname = request.host || "localhost"
		respond_to do |format|
			format.html
			format.js
		end
	end
end
