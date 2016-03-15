module SubstitutionCipher
  module Caesar
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String 
    def self.encrypt(document, key)
      # TODO: encrypt string using caesar cipher
      key > 0 ? document.to_s.chars.map { |p| (p.ord + key).chr }.join : caesar_error
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using caesar cipher
      key > 0 ? document.to_s.chars.map { |c| (c.ord - key).chr }.join : caesar_error
    end

    def caesar_error
    	"Key must be positive!"
    end
  end

  module Permutation
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using a permutation cipher
      if key > 0
      	permutation = (0..127).to_a.shuffle(random: Random.new(key))
      	document.to_s.chars.map { |p| permutation[p.ord].chr }.join
      else
      	permutation_error
      end
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using a permutation cipher
      if key > 0
      	permutation = (0..127).to_a.shuffle(random: Random.new(key))
      	document.to_s.chars.map { |c| permutation.index(c.ord).chr }.join
      else
      	permutation_error
      end
    end

    def permutation_error
    	"Key must be positive!"
    end
  end
end
