module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    # TODO: use the integers in nums_a to validate its last check digit
  end

  def validate_checksum_adi
    nums_a = number.to_s.chars.map(&:to_i)
    sum = 0
    i = 0
    nums_a.reverse_each do |n|
      if i.even?
        sum = sum + n
      else
        if n * 2 <= 9
          sum = sum + n * 2
        else
          sum = sum + n * 2 - 9
        end
      end
      i = i + 1
    end
    if (sum / 10).even?
    	true 
    else
    	false
    end
  end

  def validate_checksum_nichole
    nums_a = number.to_s.chars.map(&:to_i)
    sum_all_digits = 0
    index = 0

    nums_a.reverse.each { |number|
      if index.even?
        sum_all_digits += number 
      else
        sum_all_digits +=  number * 2 / 10 +  number * 2 % 10
      end
      index+=1
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
end
