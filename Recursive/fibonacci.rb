def fibs(n) # 0 1 1 2 3 5 8 13 .........
    return 0 if n == 1
    return 1 if n == 2
    added_sequence = 0
    n2 = 0
    n3 = 1
    (n - 2).times do
        added_sequence = n3 + n2
        n2 = n3
        n3 = added_sequence
    end
    added_sequence
end
puts fibs 6

def fibs_rec(n) # 0 1 1 2 3 5 8 13 .........
    return false if n < 1
    return 0 if n == 1
    return 1 if n == 2
    fibs_rec(n - 1) + fibs_rec(n - 2)
end
puts fibs_rec -8
puts fibs_rec 7
puts fibs_rec 2

def fibs_array(n) # 0 1 1 2 3 5 8 13 .........
    return false if n <= 0
    if n == 1
        arr = [0]
        return arr
    elsif n == 2
        return arr
    else
        (n - 2).times do |i|
            arr << arr[i + 1] + arr[i]
        end
        arr
    end
end
