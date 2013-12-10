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

class Sha2Encryptor
	include Encryptor

	def encrypt(data)
		Digest::SHA2.digest(data)
	end
end