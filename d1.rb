# Write a method, digital_root(num). It should sum the digits of a positive
# integer. If it is greater than or equal to 10, sum the digits of the
# resulting number. Keep repeating until there is only one digit in the result,
# called the "digital root". Do not use string conversion within your method.

def digital_root(num)
  while num > 9
    num = add_digits(num)
  end

  num
end

def add_digits(num)
  total = 0
  while num > 0
    total += num % 10
    num /= 10
  end
  total
end

# Write a function that takes a message and an increment amount and outputs the
#  same letters shifted by that amount in the alphabet. Assume lowercase and no
#  punctuation. Preserve spaces.

def caesar_cipher(str, shift)
  alph = ("a".."z").to_a

  decode = ""

  str.chars.each do |letter|
    if letter == " "
      decode << letter
    end

    num = alph.find_index(letter)
    decode << alph[(num + shift) % 26]
  end

  decode
end

# Write a function, longest_common_substring(str1, str2) that takes two strings
#  and returns the longest common substring. A substring is defined as any
#   consecutive slice of letters from another string.
#
# Bonus: solve it in O(m * n) using O(m * n) extra space. (Hint: the solution
#  involves dynamic programming which will be introduced later in the course.)

def longest_common_substring(str1, str2)
  def make_matrix(str1, str2)
  matrix = Array.new(str1.length + 1) { Array.new(str2.length + 1, 0) }

  str1.chars.each_with_index do |el1, idx1|
    str2.chars.each_with_index do |el2, idx2|
      if el1 == el2
        matrix[idx1 + 1][idx2 + 1] = matrix[idx1][idx2] + 1
      else
        matrix[idx1 + 1][idx2 + 1] = 0
      end
    end
  end

  matrix
end

def longest_common_substring(str1, str2)
  matrix = make_matrix(str1, str2)
  greatest_substring = ""
  matrix.each_with_index do |row, idx1|
    row.each_with_index do |length, idx2|
      if length > greatest_substring.length
        greatest_substring = str2[idx2 - length...idx2]
      end
    end
  end

  greatest_substring
end
# In this implementation, we solve the problem in a bottom up manner. We start off by creating an n x m matrix using our make_matrix helper function. This matrix will hold the length of the longest common substring at each of the first string and second string.
#
# We then iterate through each of the strings in a nested loop and compare each of the characters. If the characters are different, our common substring length that position is 0, so we add a 0 into the matrix at matrix[idx1 + 1][idx2 + 1]. Otherwise, we look to the value at matrix[idx1][idx2] (the previous positions in each of the strings) and increment it by one.
#
# Example:
#
# CAT & RAT
#
#    |"" | C | A | T
# --------------------
# "" | 0 | 0 | 0 | 0
# --------------------
# R  | 0 | 0 | 0 | 0
# --------------------
# A  | 0 | 0 | 1 | 0
# --------------------
# T  | 0 | 0 | 0 | 2  <--- Longest substring ends here!
# Once we have a matrix of the longest common substrings at each position, we can iterate through it and find the length and end position of the maximum substring. When we find the maximum length, we can find the substring by tracing back length by grabbing the substring from index - length to index.
#
# This solution is O(n * m) and takes up O(n * m) extra space for the matrix.

# Write a function that takes an array of integers and returns their sum. Use recursion.

def sum_rec(num_array)
  return 0 if num_array.empty?

  num[0] + sum_rec(num_array.drop(1))
end
