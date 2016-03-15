class Array
  def unshuffle(random:)
    transformed_order = (0...length).to_a.shuffle!(random: random)
    sort_by.with_index{|_, i| transformed_order[i]}
  end
end


module DoubleTranspositionCipher

  def self.encrypt(document, key)
      # TODO: FILL THIS IN!
    ## Suggested steps for double transposition cipher
    # 1. find number of rows/cols such that matrix is almost square
    # 2. break plaintext into evenly sized blocks
    # 3. sort rows in predictibly random way using key as seed
    # 4. sort columns of each row in predictibly random way
    # 5. return joined cyphertext
    document = document.to_s
    fill_blanks = Random.new(key).rand(100) #maintain seed state, generate same number each time
    even_size = Math.sqrt(document.length).ceil
    until document.length % even_size == 0 do document.prepend(fill_blanks.chr) end
    matrix = document.chars.map.each_slice(even_size).to_a
    matrix.shuffle!(random: Random.new(key))
    matrix.map { |m| m.shuffle!(random: Random.new(key)) }
    matrix.join
  end


  def self.decrypt(ciphertext, key)
    # TODO: FILL THIS IN!
    remove_blanks = Random.new(key).rand(100)
    even_size = Math.sqrt(ciphertext.length).ceil
    matrix = ciphertext.chars.map.each_slice(even_size).to_a
    matrix.map! { |m| m.unshuffle(random: Random.new(key)) }
    matrix = matrix.unshuffle(random: Random.new(key))
    matrix.join.gsub!(remove_blanks.chr, '')
  end
end