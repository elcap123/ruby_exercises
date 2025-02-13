# substrings

def determine_valid_substrings(string, substring_array)
  # make strings case insensitive
  string = string.downcase
  substring_array = substring_array.map {|substring| substring.downcase}

  # Return all substrings that exist
  almost_valid_substrings = substring_array.map do |substring|
    string[substring]
  end
  
  valid_substrings = almost_valid_substrings.compact

  unique_substrings = valid_substrings.uniq

  
  hash = unique_substrings.reduce(Hash.new()) do |result, substring|
    # need to figure out how to get the true count of substring instances in a string. 
    # I think .index(substring, offset) could be helpful here. 
    instances = substring_instances(string, substring)
    
    result[substring] = instances
    result
  end
  
  hash
end

def substring_instances(string, substring, offset = 0, count = 0)
  # given a string & a substring, this method should return the number of instances the substring appears.
  # This method is recursive and it uses the "count" argument to track the instances. 
  
  index = string.index(substring, offset)
  
  if index == nil
    count
  else 

    count += 1
    
    offset = index + 1
    
    substring_instances(string, substring, offset, count) # maybe it would be better to use a while loop?
  end

end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
word = "Howdy partner, sit down! How's it going?"

substring_counts = determine_valid_substrings(word, dictionary)
puts substring_counts
