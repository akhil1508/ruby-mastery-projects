def bubble_sort_by array
  j = 0
  length = array.length-1
loop do
  is_sorted = true
    length.times do |j|
      if yield(array[j],array[j+1]) <0

      elsif yield(array[j],array[j+1]) > 0
        array[j],array[j+1] = array[j+1],array[j]
       is_sorted = false
      end

    end
    break if is_sorted
end
  return  array
end
the_array= bubble_sort_by(["hi","hello","hey"]) do |left,right|
       left.length - right.length
end
puts the_array.inspect
