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
