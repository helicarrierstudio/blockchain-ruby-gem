require 'json'
require_relative 'util'

def create_wallet(password, api_code, priv: nil, label: nil, email: nil)

	params = { 'password' => password, 'api_code' => api_code }
	
	if !priv.nil?
		params['priv'] = priv
	end
	if !label.nil?
		params['label'] = label
	end
	if !email.nil?
		params['email'] = email
	end
	
	response = call_api('api/v2/create_wallet', method: 'post', data: params)
	json_response = JSON.parse(response)
	return CreateWalletResponse.new(json_response['guid'],
                                    json_response['address'],
                                    json_response['link'])
end

class CreateWalletResponse
	attr_reader :identifier
	attr_reader :address
	attr_reader :link

	def initialize(identifier, address, link)
		@identifier = identifier
		@address = address
		@link = link
	end
end
