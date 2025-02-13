
# need a function that performs the shift for one character
def caesar_single_shifter(string_char, shift_amount)
  # also need handling for wrapping with z. Probably like an if statement on whether the resulting, ordinal is > z.ord?
  # Then restart at a.ord?
  shifted_ordinal = caesar_wrap(string_char.ord, shift_amount)
  shifted_ordinal.chr
end

# need a function that loops through the supplied string calling caesar_shifter
def caesar_shifter(string, shift_amount)
  # convert to char array
  char_array = string.split("")

  shifted_array = char_array.map do |char|
    caesar_single_shifter(char, shift_amount)
  end

  # convert back to single string
  shifted_array.join
end

def caesar_wrap(ordinal, shift_amount)
  # given an ordinal and right shift amount, returns the corresponding ordinal if it should've been wrapped.
  # handles lowercase and uppercase
  shifted_ordinal = ordinal + shift_amount
  if shifted_ordinal > "z".ord
    remaining_shift_amount = shifted_ordinal - "z".ord
    
    "a".ord + remaining_shift_amount - 1
  elsif (shifted_ordinal > "Z".ord) && (shifted_ordinal < "a".ord)
    remaining_shift_amount = shifted_ordinal - "Z".ord
    "A".ord + remaining_shift_amount - 1
  else
    shifted_ordinal
  end
end


