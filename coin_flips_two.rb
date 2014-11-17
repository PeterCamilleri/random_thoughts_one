#A much quicker analysis of possible coin flipping scenarios.

#The analysis class.
class CoinFlipper

  #Perform an analysis run
  def run
    fail "Missing or invalid bit count." unless (1..1024) === (num_flips = ARGV[0].to_i)

    #Build the factorial cache
    factorial_init(num_flips)

    #Build an array to hold the results
    results = Array.new(num_flips+1, 0)


    #Cycle through all possible permutations
    (0..num_flips).each do |choose|
      results[choose] = factorial(num_flips) / (factorial(choose)* factorial(num_flips-choose))
    end

    puts results
  end

  def factorial_init(limit)
    @factorial = Array.new(limit+1, 1)
    (2..limit).each { |value| @factorial[value] = value * @factorial[value-1]}
  end

  def factorial(value)
    fail "Invalid factorial argument #{value}" unless (0...@factorial.length) === value

    @factorial[value]
  end

end

CoinFlipper.new.run