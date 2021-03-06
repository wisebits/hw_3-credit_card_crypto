require 'openssl'
require 'base64'
require 'json'

# AesCipher module with encrypt and decrypt
module AesCipher
  def self.encrypt(document, key)
    # TODO: Return JSON string of array: [iv, ciphertext]
    #       where iv is the random intialization vector used in AES
    #       and ciphertext is the output of AES encryption
    # NOTE: Use base64 for ciphertext so that it is screen printable
    #       Use cipher block chaining mode only!
    cipher = OpenSSL::Cipher::AES.new(256, :CBC).encrypt
    cipher.key = Digest::SHA256.hexdigest(key.to_s)
    iv = cipher.random_iv
    ciphertext = cipher.update(document.to_s) + cipher.final

    iv_base64 = Base64.strict_encode64(iv)
    ciphertext_base64 = Base64.strict_encode64(ciphertext)

    { iv: iv_base64, ciphertext: ciphertext_base64 }.to_json
  end

  def self.decrypt(aes_crypt, key)
    # TODO: decrypt from JSON output (aes_crypt) of encrypt method above
    encrypted_aes = JSON.parse(aes_crypt)
    decipher = OpenSSL::Cipher::AES.new(256, :CBC).decrypt
    decipher.key = Digest::SHA256.hexdigest(key.to_s)
    decipher.iv = Base64.strict_decode64(encrypted_aes['iv'])

    ciphertext_base64 = Base64.strict_decode64(encrypted_aes['ciphertext'])

    decipher.update(ciphertext_base64) + decipher.final
  end
end
