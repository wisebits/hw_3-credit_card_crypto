require_relative '../credit_card'
require 'minitest/autorun'
require 'yaml'

cards = YAML.load_file 'spec/test_numbers.yml'

cards.each do |name, numbers|
  describe "HAPPY: Test valid #{name} card numbers" do
    numbers['valid'].each do |number|
      it "works on card #: #{number}" do
        card = CreditCard.new(number, nil, nil, nil)
        card.validate_checksum_nichole.must_equal true
        card.validate_checksum_adi.must_equal true
        card.validate_checksum_elvis.must_equal true
      end
    end
  end

  describe "SAD: Test invalid #{name} card numbers" do
    numbers['invalid'].each do |number|
      it "should not work on card #: #{number}" do
        card = CreditCard.new(number, nil, nil, nil)
        card.validate_checksum_elvis.wont_equal true
        card.validate_checksum_nichole.wont_equal true
        card.validate_checksum_adi.wont_equal true
      end
    end
  end
end
