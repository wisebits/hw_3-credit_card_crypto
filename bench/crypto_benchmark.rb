require 'benchmark'
require_relative '../substitution_cipher'
require_relative '../double_trans_cipher'

Benchmark.bm(15) do |bench|
  n = 100_000
  key = Random.rand(5..10)
  document_length = Random.rand(20..50)

  documents = n.times.map do 
    document_length.times.map { Random.rand(0..127).chr.to_s }.join
  end

  #benchmark for Caesar Cipher
  bench.report('Caesar Cipher') do
    documents.each do |doc|
      doc_enc = SubstitutionCipher::Caesar.encrypt(doc, key)
      doc_dec = SubstitutionCipher::Caesar.decrypt(doc_enc, key)
    end
  end

  #benchmark for Permutation Cipher
  bench.report('Permutation Cipher') do
    documents.each do |doc|
      doc_enc = SubstitutionCipher::Permutation.encrypt(doc, key)
      doc_dec = SubstitutionCipher::Permutation.decrypt(doc_enc, key)
    end
  end

  #benchmark for Double Transposition Cipher
  bench.report('Double Trans. Cipher') do
    documents.each do |doc|
      doc_enc = DoubleTranspositionCipher.encrypt(doc, key)
      doc_dec = DoubleTranspositionCipher.decrypt(doc_enc, key)
    end
  end
end
