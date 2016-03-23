require_relative '../credit_card'
require 'minitest/autorun'

# Feel free to replace the contents of cards with data from your own yaml file
card_details = [
  { num: '4916603231464963', exp: 'Mar-30-2020', name: 'Soumya Ray', net: 'Visa' },
  { num: '6011580789725897', exp: 'Sep-30-2020', name: 'Nick Danks', net: 'Visa' },
  { num: '5423661657234057', exp: 'Feb-30-2020', name: 'Lee Chen', net: 'Mastercard' }
]

cards = card_details.map { |c| CreditCard.new(c[:num], c[:exp], c[:name], c[:net]) }

describe 'Test hashing requirements' do
  describe 'Test regular hashing' do
    describe 'Check hashes are consistently produced' do
      cards.each do |cardinfo|
        #hash = cardinfo.hash
        #hash.wont_be_empty  --gives nilclass error
      end
      # TODO: Check that each card produces the same hash if hashed repeatedly
      it 'should produce the same hash for identical cards' do
        hashes = []
        cards.each { |card| 2.times { hashes.push(card.hash) } }
        hashes.each_index do |i|
          hashes[i].wont_be_nil
          hashes[i].must_equal hashes[i + 1] if i.even?
        end
      end
    end

    describe 'Check for unique hashes' do
      # TODO: Check that each card produces a different hash than other cards
      it 'should produce different hashes for different cards' do
        hashes = []
        cards.each { |card| hashes.push(card.hash) }
        hashes.uniq.length.must_equal hashes.length
      end
    end
  end

  describe 'Test cryptographic hashing' do
    describe 'Check hashes are consistently produced' do
      # TODO: Check that each card produces the same hash if hashed repeatedly
      it 'should produce the same hash for identical cards' do
        hashes = []
        cards.each { |card| 2.times { hashes.push(card.hash_secure) } }
        hashes.each_index do |i|
          hashes[i].wont_be_nil
          hashes[i].must_equal hashes[i + 1] if i.even?
        end
      end
    end

    describe 'Check for unique hashes' do
      # TODO: Check that each card produces a different hash than other cards
      it 'should produce different hashes for different cards' do
        hashes = []
        cards.each { |card| hashes.push(card.hash_secure) }
        hashes.uniq.length.must_equal hashes.length
      end
    end

    describe 'Check regular hash not same as cryptographic hash' do
      # TODO: Check that each card's hash is different from its hash_secure
      it 'should not produce the same hash' do
        cards.each { |card| card.hash.wont_equal card.hash_secure }
      end
    end
  end
end
