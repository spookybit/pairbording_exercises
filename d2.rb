# Write a function, fibs(num) which returns the first n elements from the
# fibonnacci sequence, given n.
#
# Solve it both iteratively and recursively.

def fibs(num)
  return [] if num == 0
  return [0] if num == 1

  array = [0, 1]

  while array.length < num
    array << array[-1] + array[-2]
  end

  array
end

# Write a JavaScript function that takes a string and returns true if it's a
# palindrome, false if it's not. Use JavaScript.
#
# This solution takes less time and memory than rebuilding the string backward
# and comparing the two.

function Palindrome(string) {
  for (let i = 0; i < string.length/2; i++) {
    if (string[i] !== string[- 1 - i]) {
      return false;
    }
  }
  return true;
}
