# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
	# Указывает путь к файлу
	token_file = Rails.root.join('.secret')
	# Проверяет есть ли этот файл
	if File.exist?(token_file)
	# Читает файл убирая все переносы строк и табуляции
		File.read(token_file).chomp
	else
	# Создает токен в котором 128 рандомных символов
		token = SecureRandom.hex(64)
	# Создает файл и записывает в него токен	
		File.write(token_file, token)
	# Выдает значение токена из метода
		token	
	end
end

SampleApp::Application.config.secret_key_base = secure_token