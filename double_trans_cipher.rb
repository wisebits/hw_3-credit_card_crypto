module DoubleTranspositionCipher
  def self.encrypt(document, key)
    # TODO: FILL THIS IN!
    ## Suggested steps for double transposition cipher
    # 1. find number of rows/cols such that matrix is almost square
    # 2. break plaintext into evenly sized blocks
    # 3. sort rows in predictibly random way using key as seed
    # 4. sort columns of each row in predictibly random way
    # 5. return joined cyphertext
    str = document.to_s
    col = Math.sqrt(str.length).ceil
    matrix = []
    str.chars.map.each_slice(col) { |c| matrix << c}
    matrix.shuffle!(random: Random.new(key))
    matrix.map { |m| m.shuffle!(random: Random.new(key))}.join
  end

  def self.decrypt(ciphertext, key)
    # TODO: FILL THIS IN!
  end
end
