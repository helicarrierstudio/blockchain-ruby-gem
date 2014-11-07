require 'net/http'

module Blockchain

	class APIException < StandardError
	end

	BASE_URL = "https://blockchain.info/"
	TIMEOUT_SECONDS = 10
	
	def self.call_api(resource, method: 'get', data: nil)
		url = URI.parse(BASE_URL + resource)
		http = Net::HTTP.new(url.host, url.port)
		http.use_ssl = true
		http.read_timeout = TIMEOUT_SECONDS
		
		request = nil
		if method == 'get'
			url.query = data.nil? ? nil : URI.encode_www_form(data)
			request = Net::HTTP::Get.new(url.request_uri)
		elsif method == 'post'
			request = Net::HTTP::Post.new(url.request_uri)
			request.content_type = 'application/x-www-form-urlencoded'
			if data != nil then request.set_form_data(data) else {} end
		end
		
		response = http.request(request)
		if response.code != '200'
			raise APIException, response.body
		end
		return response.body
	end

end