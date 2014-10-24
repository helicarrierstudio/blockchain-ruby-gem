require 'json'
require_relative 'util'

class ReceiveResponse
	attr_reader :fee_percent
	attr_reader :destination
	attr_reader :input_address
	attr_reader :callback_url
	
	def initialize(fee_percent, dest, input, callback)
		@fee_percent = fee_percent
		@destination = dest
		@input_address = input
		@callback_url = callback
	end
end	

def receive(dest_addr, callback, api_code = nil)
	params = { 'method' => 'create', 'address' => dest_addr, 'callback' => callback }
	if !api_code.nil? then params['api_code'] = api_code end
	resp = call_api('api/receive', method: 'post', data: params)
	json_resp = JSON.parse(resp)
	receive_response = ReceiveResponse.new(json_resp['fee_percent'],
											json_resp['destination'],
											json_resp['input_address'],
											json_resp['callback_url'])
	return receive_response
end