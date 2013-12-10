require 'digest'

module Encryptor
	def encrypt(data)
		raise
	end
end

class Md5Encryptor
	include Encryptor

	def encrypt(data)
		Digest::MD5.digest(data)
	end
end

class Sha1Encryptor
	include Encryptor

	def encrypt(data)
		Digest::SHA1.digest(data)
	end
end

# Add a logger during encryption using the decorator pattern
class LoggerDecorator
	def initialize(encryptor)
		@encryptor = encryptor
	end

	def encrypt(data)
		puts "Encryption has started..."
		@encryptor.encrypt(data)
		puts "Encryption has finished..."
	end
end