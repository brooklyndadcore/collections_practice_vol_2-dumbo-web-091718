def begins_with_r(array)
  array.each do |word|
    if word[0].downcase != "r"
      return false
    end
  end
    return true
end

def contain_a(array)
  return array.select {|word| word.downcase.include?("a")}
end

def first_wa(array)
 word = array.find do |ele| 
  if ele.class == String
    ele.include?("wa")
  end
 end
 return word
end

def remove_non_strings(array)
  return array.select {|word| word.class == String}
end

def count_elements(array)
  count = {:count => 1}
  new_arr = array.collect {|ele| ele.merge(count)}
  new_arr.each_with_index do |ele1, idx1|
    new_arr.each_with_index do |ele2, idx2|
      if ele1 == ele2 && idx1!= idx2
        new_arr.delete_at(idx2)
        ele1[:count] += 1
      end
    end
  end
  return new_arr
end

def merge_data(key, data)
  merged_arr = []
  data.each do |ele|
    ele.each do |k, v|
      key.each do |ele1|
        ele1.each do |k1, v1|
          if k == v1
            merged_arr << ele1.merge(v)
          end
        end
      end
    end
  end
  return merged_arr
end 

def find_cool(cool)
  cool.each do |ele|
    if ele.has_value?("cool")
      return [ele]
    end
  end
end

def organize_schools(ha_sh)
  by_location = {}

  ha_sh.each do |sch, key|
    city = key[:location]
    by_location[city] = [] 
  end

  by_location.map do |k1, v1|
   val = []
    ha_sh.each do |k, v|
      town = v.values
      if town == [k1]
      val << k
        by_location[k1] = val 
      end
    end
  end

  return by_location
end
  
  