require_relative '../credit_card'
require_relative '../substitution_cipher'
require_relative '../double_trans_cipher'
require 'minitest/autorun'

ciphers = ['Caesar', 'Permutation', 'Double Transposition']

describe 'Test card info encryption' do
  before do
    @cc = CreditCard.new('4916603231464963', 'Mar-30-2020', 'Soumya Ray', 'Visa')
    @key = 3
  end

  ciphers.each do |name|
    describe 'Using #{name} cipher' do
      it 'should encrypt card information' do
        case name
        when 'Caesar'
          enc = SubstitutionCipher::Caesar.encrypt(@cc, @key)
        when 'Permutation'
          enc = SubstitutionCipher::Permutation.encrypt(@cc, @key)
        when 'Double Transposition'
          enc = DoubleTranspositionCipher.encrypt(@cc, @key)
        end
        enc.wont_equal @cc.to_s
      end

      it 'should decrypt text' do
        case name
        when 'Caesar'
          enc = SubstitutionCipher::Caesar.encrypt(@cc, @key)
          dec = SubstitutionCipher::Caesar.decrypt(enc, @key)
        when 'Permutation'
          enc = SubstitutionCipher::Permutation.encrypt(@cc, @key)
          dec = SubstitutionCipher::Permutation.decrypt(enc, @key)
        when 'Double Transposition'
          enc = DoubleTranspositionCipher.encrypt(@cc, @key)
          dec = DoubleTranspositionCipher.decrypt(enc, @key)
        end
        dec.must_equal @cc.to_s
      end
    end
  end
end
