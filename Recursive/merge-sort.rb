def merge_sort(array)
    return array if array.length == 1
    array1 = array[0, array.length / 2]
    array2 = array[array.length / 2, array.length]
    sorted_array1 = merge_sort(array1)
    sorted_array2 = merge_sort(array2)
    merge(sorted_array1, sorted_array2)
end

def merge(array1, array2)
    sorted = []
    until array1.empty? || array2.empty?
        if array1[0] <= array2[0]
            sorted << array1[0]
            array1.shift
        else
            sorted << array2[0]
            array2.shift
        end
    end
    if array1.empty?
        array2.each { |i| sorted << i }
    elsif array2.empty?
        array1.each { |i| sorted << i }
    end
    sorted
end
puts merge_sort [1, 2, 334, 42, 11]
