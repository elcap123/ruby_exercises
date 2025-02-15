# maybe go recursive?
#   Some variable for tracking whether we did a sort in this loop
#   Or we could just break the replacement function & restart the loop? 
# Need some function that swaps two indices. 
#   It seems like .fill(object, start, count) is the easiest method to use here? 
#     If we .fill("-", index, 2) then we'd just replace the "-" with the relevant numbers.
#   Otherwise would need to 1) split the array at the index, 2) pop + shift the first half, 
#     3) unshift the 2nd half, and 4) join the arrays.

def bubble_sort(array)
  
  while unsorted?(array) do 
    array.each_with_index do |num, index|
      if index == array.length-1 # no need to evaluate for the last index.
        break
      elsif num > array[index + 1]
        swap_indices!(array, index)
        break
      end
    end
    debugger
    array
    
  end
end

def unsorted?(array)
  # returns true if the array is unsorted
  # assumes array of integers
  unsorted = true

  array.each_with_index do |num, index|
    if index == array.length - 1 # if we've reached the last index, we know it's sorted. 
      unsorted = false
    elsif num > array[index + 1]
      unsorted = true
      break # end loop if we're unsorted
    end
  end

  unsorted
end

def swap_indices!(array, index_1)
  # this actually modifies the underlying array!
  # swaps values at index_1 & it's right-adjacent index
  array.insert(index_1, array[index_1 + 1], array[index_1])
  # delete one of the extra values
  array.delete_at(index_1 + 2)
  # delete the other extra value
  array.delete_at(index_1 + 2)
end



bubble_sort([4,3,78,2,0,2]) # => [0,2,2,3,4,78]
