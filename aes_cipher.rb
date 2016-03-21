require 'openssl'
require 'base64'
require 'json'

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

    {iv: Base64.strict_encode64(iv), ciphertext: Base64.strict_encode64(ciphertext)}.to_json
  end

  def self.decrypt(aes_crypt, key)
    # TODO: decrypt from JSON output (aes_crypt) of encrypt method above
    encrypted_aes = JSON.parse(aes_crypt)
    decipher = OpenSSL::Cipher::AES.new(256, :CBC).decrypt
    decipher.key = Digest::SHA256.hexdigest(key.to_s)
    decipher.iv = Base64.strict_decode64(encrypted_aes['iv'])

    plaintext = decipher.update(Base64.strict_decode64(encrypted_aes['ciphertext'])) + decipher.final

  end
end

# quick test
test = AesCipher.encrypt("thisisteamwisebits",5)
puts (test)
puts(AesCipher.decrypt(test,5))