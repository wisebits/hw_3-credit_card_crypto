require_relative '../credit_card'
require_relative '../substitution_cipher'
require_relative '../double_trans_cipher'
require 'minitest/autorun'

define_method :testing do |my_args|
  describe 'Test card info encryption' do
    before do
      @cc = CreditCard.new('4916603231464963', 'Mar-30-2020',
                           'Soumya Ray', 'Visa')
      @key = 3
    end
    describe 'Using #{my_args} cipher' do
      it 'should encrypt card information' do
        enc = my_args.encrypt(@cc, @key)
        enc.wont_equal @cc.to_s
      end
      it 'should decrypt text' do
        enc = my_args.encrypt(@cc, @key)
        dec = my_args.decrypt(enc, @key)
        dec.must_equal @cc.to_s
      end
    end
  end
end

testing(SubstitutionCipher::Caesar)
testing(SubstitutionCipher::Permutation)
testing(DoubleTranspositionCipher)
