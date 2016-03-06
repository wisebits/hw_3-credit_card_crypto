module LuhnValidator
	# Validates credit card number using Luhn Algorithm
	# arguments: none
	# assumes: a local String called 'number' exists
	# returns: true/false whether last digit is correct
	def validate_checksum
		nums_a = number.to_s.chars.map(&:to_i)
		sum = 0
		nums_a.reverse.each.with_index do |num, i|
			if i.even?
				sum+=num
			else
				sum+=((2 * num).divmod(10).inject(:+))
			end
		end
		return sum%10==0 ? true : false
	end
end
