require 'ipaddr'
require 'net/http'
class TestController < ApplicationController
	def error
		socket_name = Socket.gethostname
		puts 'SocketName='+socket_name
	end
end
