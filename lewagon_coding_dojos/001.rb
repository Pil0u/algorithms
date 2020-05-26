# Subject: https://www.codewars.com/kata/555615a77ebc7c2c8a0000b8/train/ruby

# Solution

def tickets(people)
  n_25, n_50 = 0, 0
  
  people.each do |ticket|
    n_25 += 1 if ticket == 25
    
    if ticket == 50
      return 'NO' if n_25 < 1
      n_25 -= 1
      n_50 += 1
    end
    
    if ticket == 100
      if n_50 >= 1 && n_25 >= 1
      # This scenario has to be prioritized because it maximizes the number of 25 you store
        n_25 -= 1
        n_50 -= 1
      elsif n_25 >= 3
        n_25 -= 3
      else
        return 'NO'
      end
    end
  end
  
  # If you pass the loop without returning a NO, then it's a YES
  return 'YES'
end

# Tests

Test.assert_equals(tickets([25, 25, 50]), 'YES')
Test.assert_equals(tickets([25, 25, 50, 25, 50, 50]), 'YES')
Test.assert_equals(tickets([25, 25, 50, 25, 50, 50, 50]), 'NO')
Test.assert_equals(tickets([25, 100]), 'NO')
Test.assert_equals(tickets([25, 25, 25, 50, 25, 100, 50]), 'YES')
