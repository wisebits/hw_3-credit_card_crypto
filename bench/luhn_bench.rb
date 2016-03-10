require 'benchmark'
require_relative '../credit_card'

Benchmark.bm(15) do |bench|
  n = 200_000
  card_number_length = 16

  card_numbers = n.times.map do
    card_number_length.times.map { Random.rand(10).to_s }.join
  end
 
  bench.report('luhn_benchmark_nichole') do
    5.times do
      card_numbers.each do |number|
        cc = CreditCard.new(number, nil, nil, nil)
        cc.validate_checksum_nichole
      end
    end
  end

  bench.report('luhn_benchmark_elvis') do
    5.times do
      card_numbers.each do |number|
        cc = CreditCard.new(number, nil, nil, nil)
        cc.validate_checksum_elvis
      end
    end
  end

  bench.report('luhn_benchmark_adi') do
    5.times do
      card_numbers.each do |number|
        cc = CreditCard.new(number, nil, nil, nil)
        cc.validate_checksum_adi
      end
    end
  end

end
