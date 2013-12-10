require 'digest'

module Encryptor
	attr_accessor :successor 

	def initialize(request, data)
		@request = request
		@data = data
	end

	def encrypt
		raise
	end
end

class Md5Encryptor
	include Encryptor

	def encrypt
		if @request.is_md5?
			Digest::MD5.digest(@data)
		elsif successor
			successor.encrypt(@data)
		end
	end
end

class Sha1Encryptor
	include Encryptor

	def encrypt
		if @request.is_sha1?
			Digest::SHA1.digest(@data)
		elsif successor
			successor.encrypt(@data)
		end
	end
end

class Sha2Encryptor
	include Encryptor

	def encrypt
		if @request.is_sha2?
			Digest::SHA2.digest(@data)
		elsif successor
			successor.encrypt(@data)
		end
	end
end

class NilEncryptor
	include Encryptor

	def encrypt
		"NIL!"
	end
end

request = :md5
md5 = Md5Encryptor.new(request, "sampledata")
sha1 = Sha1Encryptor.new(request, "sampledata")
sha2 = Sha2Encryptor.new(request, "sampledata")
nil_encryptor = NilEncryptor.new(request, "sampledata")

md5.successor = sha1 
sha1.successor = sha2
sha2.successor = nil_encryptor

md5.encrypt