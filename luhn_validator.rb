module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    # TODO: use the integers in nums_a to validate its last check digit
  end

  def validate_checksum_nichole
    nums_a = number.to_s.chars.map(&:to_i)
    sum_all_digits = 0

    nums_a.reverse.each.with_index { |number, index|
      if index % 2 == 0
        sum_all_digits += number 
      else
        two_digit_number = number * 2
        sum_all_digits += two_digit_number / 10 + two_digit_number % 10
      end
    }
    sum_all_digits % 10 == 0 ? true : false
  end

  def validate_checksum_elvis
    nums_a = number.to_s.chars.map(&:to_i)
    sum = 0
    index = 0

    nums_a.reverse_each do |num|
      if index.even?
        sum += num
      else
      	product = num * 2
        if product <= 9
          sum += product
        else
          sum += product / 10 + product % 10
        end
      end
      index+=1
    end
    sum % 10 == 0 ? true : false
  end

  def validate_checksum_adi
    nums_a = number.to_s.chars.map(&:to_i)
    nums_a.reverse!.each.with_index do |n, i|
      unless i.even?
        unless n * 2 > 9
          nums_a[i] = n * 2
        else
          nums_a[i] = n * 2 - 9
        end
      end
    end
    nums_a.reduce(&:+) % 10 == 0 ? true : false
    # TODO: use the integers in nums_a to validate its last check digit
  end
end
