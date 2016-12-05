def bubble_sort array
  j = 0
  length = array.length-1
loop do
  is_sorted = true
    length.times do |j|
      if array[j]>array[j+1]
        array[j],array[j+1] = array[j+1],array[j]
      is_sorted = false
      end

    end
    break if is_sorted
  end
      return  array
  end
 my_array = []
 user_input = ' '
  puts "Enter array, one integer at a time; input blank to end"
  while(user_input!='')
    user_input=gets.chomp
  my_array.push(user_input.to_i)
end
my_array.pop
puts bubble_sort(my_array)
