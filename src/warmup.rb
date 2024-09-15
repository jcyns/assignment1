def fib(n)
    return [] if n == 0
    return [0] if n == 1
    
    fib = [0, 1]
    (2...n).each do |i|
      fib << fib[i-1] + fib[i-2]
    end
    fib
  end
  #change the number in the parenthesis to change the output
  puts "fib(15) == #{fib(15).join(', ')}"
def isPalindrome(n)
    n_str = n.to_s
    n_str == n_str.reverse
end
[10, 101, 120210].each do |n|
    puts "isPalindrome(#{n}) == #{isPalindrome(n)}"
  end
def nthmax(n, a)
    return nil if n < 0 || a.empty?
  
  unique_sorted = a.uniq.sort.reverse
  unique_sorted[n]
end
puts "nthmax(0, [1,2,3,0]) == #{nthmax(0, [1,2,3,0])}"
puts "nthmax(1, [3,2,1,0]) == #{nthmax(1, [3,2,1,0])}"
puts "nthmax(2, [7,3,4,5]) == #{nthmax(2, [7,3,4,5])}"
puts "nthmax(5, [1,2,3]) == #{nthmax(5, [1,2,3])}"
def freq(s)
    return '' if s.empty?
 
    char_count = s.each_char.tally

    max_char = char_count.max_by { |char, count| count }
  
    max_char[0]  
end
puts "freq(\"\") == \"#{freq("")}\""
puts "freq(\"aaabb\") == \"#{freq("aaabb")}\""
puts "freq(\"bbaaa\") == \"#{freq("bbaaa")}\""
puts "freq(\"ssabcd\") == \"#{freq("ssabcd")}\""
puts "freq(\"a12xxxxxyyyxyxyxy\") == \"#{freq("a12xxxxxyyyxyxyxy")}\""

def zipHash(arr1, arr2)
    return nil if arr1.length != arr2.length

  # Combine elements of arr1 and arr2 into a hash
  Hash[arr1.zip(arr2)]
end
puts "zipHash([], []) == #{zipHash([], []).inspect}"
puts "zipHash([1], [2]) == #{zipHash([1], [2]).inspect}"
puts "zipHash([1, 5], [2, 4]) == #{zipHash([1, 5], [2, 4]).inspect}"
puts "zipHash([1], [2, 3]) == #{zipHash([1], [2, 3]).inspect}"
puts "zipHash([\"Umar\", \"Justin\", \"Yuhong\"], [\"prof\", \"TA\", \"TA\"]) == #{zipHash(["Umar", "Justin", "Yuhong"], ["prof", "TA", "TA"]).inspect}"
def hashToArray(hash)
    hash.map { |key, value| [key, value] }
end
puts "hashToArray({}) == #{hashToArray({})}"
puts "hashToArray({\"a\" => \"b\"}) == #{hashToArray({"a" => "b"})}"
puts "hashToArray({\"x\" => \"v\", \"y\" => \"w\", \"z\" => \"u\"}) == #{hashToArray({"x" => "v", "y" => "w", "z" => "u"})}"