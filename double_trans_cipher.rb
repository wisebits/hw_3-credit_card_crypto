module DoubleTranspositionCipher

  def self.encrypt(document, key)
      # TODO: FILL THIS IN!
    ## Suggested steps for double transposition cipher
    # 1. find number of rows/cols such that matrix is almost square
    # 2. break plaintext into evenly sized blocks
    # 3. sort rows in predictibly random way using key as seed
    # 4. sort columns of each row in predictibly random way
    # 5. return joined cyphertext
    document = document.to_s.chars.map(&:to_s)

    size = Math.sqrt(document.length).ceil

    # test matrix
    output = document.each_slice(size).to_a
    output.each do |x| 
      puts "#{x}" 
    end


    
  
  end

  

  def self.decrypt(ciphertext, key)
    # TODO: FILL THIS IN!
  end
end

document = 'attackatdawn'
DoubleTranspositionCipher.encrypt(document, 3)
