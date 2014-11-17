#An analysis of possible coin flipping scenarios.

#The analysis class.
class CoinFlipper

  #Perform an analysis run
  def run
    fail "Missing or invalid bit count." unless (1..32) === (num_bits = ARGV[0].to_i)

    #Build an array to hold the results
    results = Array.new(num_bits+1, 0)

    #Compute the upper limit
    limit = 1 << num_bits

    #Cycle through all possible permutations
    (0...limit).each do |value|
      results[count_set_bits(value)] += 1
    end

    puts results
  end

  def count_set_bits(value)
    result = 0

    while value > 0
      result += 1 if (value & 0x1) == 0x1
      value = value >> 1
    end

    result
  end

end

CoinFlipper.new.run