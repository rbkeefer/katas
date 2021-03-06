defmodule ProjectEuler do
  require Integer

  # -------------------------------------------------------
  @doc """
    Problem 9: https://projecteuler.net/problem=9
    A Pythagorean triplet is a set of three natural numbers,
    a < b < c, for which,

        a^2 + b^2 = c^2

    For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2

    There exists exactly one Pythagorean triplet for
    which a + b + c = 1000.

    Find the product abc.
  """
  def pythagorean_triplet(triplet_sum) do
    # [a, b, c] = find_abc()
    #
    # if a + b + c == triplet_sum do
    #   a * b * c
    # else
    #   # find next abc
    # end
  end

  # -------------------------------------------------------
  @doc """
    Problem 8: https://projecteuler.net/problem=8

    The four adjacent digits in the 1000-digit number that have
    the greatest product are 9 × 9 × 8 × 9 = 5832.

      73167176531330624919225119674426574742355349194934
      96983520312774506326239578318016984801869478851843
      85861560789112949495459501737958331952853208805511
      12540698747158523863050715693290963295227443043557
      66896648950445244523161731856403098711121722383113
      62229893423380308135336276614282806444486645238749
      30358907296290491560440772390713810515859307960866
      70172427121883998797908792274921901699720888093776
      65727333001053367881220235421809751254540594752243
      52584907711670556013604839586446706324415722155397
      53697817977846174064955149290862569321978468622482
      83972241375657056057490261407972968652414535100474
      82166370484403199890008895243450658541227588666881
      16427171479924442928230863465674813919123162824586
      17866458359124566529476545682848912883142607690042
      24219022671055626321111109370544217506941658960408
      07198403850962455444362981230987879927244284909188
      84580156166097919133875499200524063689912560717606
      05886116467109405077541002256983155200055935729725
      71636269561882670428252483600823257530420752963450

    Find the thirteen adjacent digits in the 1000-digit number that
    have the greatest product. What is the value of this product?

  """
  @the_series "7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450"
  def largest_in_series(window_length) do
    find_max_in_series(0, window_length, 0)
  end

  defp find_max_in_series(window_start, window_length, max_value)
       when window_start > 1000 - window_length,
       do: max_value

  defp find_max_in_series(window_start, window_length, max_value) do
    value =
      String.slice(@the_series, window_start, window_length)
      |> mult_string(0, window_length)

    if value > max_value do
      find_max_in_series(window_start + 1, window_length, value)
    else
      find_max_in_series(window_start + 1, window_length, max_value)
    end
  end

  defp mult_string(_window, window_location, window_length)
       when window_location >= window_length,
       do: 1

  defp mult_string(window, window_location, window_length) do
    String.to_integer(String.at(window, window_location)) *
      mult_string(window, window_location + 1, window_length)
  end

  # -------------------------------------------------------
  @doc """
    Problem 7: https://projecteuler.net/problem=7
    By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
    we can see that the 6th prime is 13.

    What is the 10 001st prime number?
  """
  def nth_prime_number(nth_prime) do
    _nth_prime_number(2, 1, nth_prime, 2)
  end

  defp _nth_prime_number(_potential_prime, prime_counter, nth_prime, prime_num)
       when prime_counter > nth_prime,
       do: prime_num

  defp _nth_prime_number(potential_prime, prime_counter, nth_prime, prime_num) do
    if is_prime?(5, 2, potential_prime) do
      _nth_prime_number(potential_prime + 1, prime_counter + 1, nth_prime, potential_prime)
    else
      _nth_prime_number(potential_prime + 1, prime_counter, nth_prime, prime_num)
    end
  end

  def is_prime?(_i, _w, num) when num == 2, do: true
  def is_prime?(_i, _w, num) when num == 3, do: true
  def is_prime?(_i, _w, num) when rem(num, 2) == 0, do: false
  def is_prime?(_i, _w, num) when rem(num, 3) == 0, do: false

  def is_prime?(i, w, num) when i * i <= num do
    if rem(num, i) == 0 do
      false
    else
      is_prime?(i + w, 6 - w, num)
    end
  end

  def is_prime?(_i, _w, _num), do: true

  # -------------------------------------------------------
  @doc """
    Problem 6: https://projecteuler.net/problem=6
    The sum of the squares of the first ten natural numbers is,

             1^2 + 2^2 + ... + 10^2 = 385

    The square of the sum of the first ten natural numbers is,

             (1 + 2 + ... + 10)^2 = 55^2 = 3025

    Hence the difference between the sum of the squares of the
    first ten natural numbers and the square of the sum is
    3025 − 385 = 2640.

    Find the difference between the sum of the squares of the
    first one hundred natural numbers and the square of the sum.
  """
  def square_difference(max_num) do
    square_sum(1, max_num, 0) - sum_squares(1, max_num, 0)
  end

  def sum_squares(current_num, max_num, sum) when current_num > max_num, do: sum

  def sum_squares(current_num, max_num, sum),
    do: sum_squares(current_num + 1, max_num, sum + current_num * current_num)

  def square_sum(current_num, max_num, sum) when current_num > max_num, do: sum * sum

  def square_sum(current_num, max_num, sum),
    do: square_sum(current_num + 1, max_num, sum + current_num)

  # -------------------------------------------------------
  @doc """
    Problem 5: https://projecteuler.net/problem=5
    2520 is the smallest number that can be divided by each of
    the numbers from 1 to 10 without any remainder.

    What is the smallest positive number that is evenly divisible
    by all of the numbers from 1 to 20?
  """
  def smallest_divisible() do
    divisible_by(1, 2)
  end

  defp divisible_by(value, divisor) when divisor > 20, do: value

  defp divisible_by(value, divisor) when rem(value, divisor) == 0,
    do: divisible_by(value, divisor + 1)

  defp divisible_by(value, _divisor), do: divisible_by(value + 1, 2)

  # -------------------------------------------------------
  @doc """
    Problem 4: https://projecteuler.net/problem=4
    A palindromic number reads the same both ways. The largest palindrome made
    from the product of two 2-digit numbers is 9009 = 91 × 99.

    Find the largest palindrome made from the product of two 3-digit numbers.
  """
  def largest_palindrome(max_no) do
    find_max(max_no, max_no, 0)
  end

  defp find_max(x, _y, max_value) when x < 100, do: max_value
  defp find_max(x, y, max_value) when y < 100, do: find_max(x - 1, 999, max_value)

  defp find_max(x, y, max_value) do
    if(is_palindrome?(x * y, x * y, 0)) do
      find_max(x, y - 1, max(max_value, x * y))
    else
      find_max(x, y - 1, max_value)
    end
  end

  defp is_palindrome?(x, a, b) when a < 1, do: x == b
  defp is_palindrome?(x, a, b), do: is_palindrome?(x, div(a, 10), b * 10 + rem(a, 10))

  # -------------------------------------------------------
  @doc """
    Problem 3: https://projecteuler.net/problem=3
    The prime factors of 13195 are 5, 7, 13 and 29.
    What is the largest prime factor of the number 600851475143?
  """
  def prime_factors(num) do
    _prime_factors(num, 2)
  end

  defp _prime_factors(num, prime_num)
       when num >= prime_num * prime_num and rem(num, prime_num) == 0,
       do: [prime_num | _prime_factors(div(num, prime_num), prime_num)]

  defp _prime_factors(num, prime_num)
       when num >= prime_num * prime_num,
       do: _prime_factors(num, prime_num + 1)

  defp _prime_factors(num, _prime_num), do: [num]

  # -------------------------------------------------------
  @doc """
    Problem 2: https://projecteuler.net/problem=2
    Each new term in the Fibonacci sequence is generated by adding the previous two terms.
    By starting with 1 and 2, the first 10 terms will be:
      1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
    By considering the terms in the Fibonacci sequence whose values do not exceed four million,
    find the sum of the even-valued terms.
  """

  def sum_even_fib_nums(prev1, prev2, max_value, sum_value)
      when prev2 < max_value and Integer.is_even(prev2),
      do: sum_even_fib_nums(prev2, prev1 + prev2, max_value, sum_value + prev2)

  def sum_even_fib_nums(prev1, prev2, max_value, sum_value)
      when prev2 < max_value,
      do: sum_even_fib_nums(prev2, prev1 + prev2, max_value, sum_value)

  def sum_even_fib_nums(_prev1, _prev2, _max_no, sum_value), do: sum_value

  # -------------------------------------------------------
  @doc """
    Problem 1: https://projecteuler.net/problem=1
    If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
    The sum of these multiples is 23.
    Find the sum of all the multiples of 3 or 5 below 1000.
  """
  def sum_mult35(arg) do
    _sum_mult35(0, arg, 0)
  end

  defp _sum_mult35(current_value, max_value, sum_value)
       when current_value == max_value,
       do: sum_value

  defp _sum_mult35(current_value, max_value, sum_value)
       when rem(current_value, 3) == 0 and rem(current_value, 5) == 0,
       do: _sum_mult35(current_value + 1, max_value, sum_value + current_value)

  defp _sum_mult35(current_value, max_value, sum_value)
       when rem(current_value, 3) == 0 or rem(current_value, 5) == 0,
       do: _sum_mult35(current_value + 1, max_value, sum_value + current_value)

  defp _sum_mult35(current_value, max_value, sum_value),
    do: _sum_mult35(current_value + 1, max_value, sum_value)
end
