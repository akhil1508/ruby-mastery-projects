def caesar_cipher(string_to_be_encrypted,encryption_key)
  if(!encryption_key.match('\d+'))
    return 0
  end
  iterating_variable=0
  new_string=''
  encryption_key=encryption_key.to_i
  if(encryption_key >26)
    encryption_key = encryption_key%26
  end
string_to_be_encrypted.split('').each do |letter|

    integer_code = letter.ord.to_i

   if (letter.match('[a-zA-Z]'))
     if letter.downcase == letter
        if(encryption_key+integer_code>122)
          iterating_variable = 97
          letter = (iterating_variable + encryption_key+integer_code-123).chr

        else
          iterating_variable = encryption_key + integer_code
          letter = (iterating_variable).chr


        end
     elsif(letter.upcase == letter)
       if(encryption_key+integer_code>90)
         iterating_variable = 65
         letter = (iterating_variable+encryption_key+integer_code-91).chr

        else
         iterating_variable=encryption_key+integer_code
         letter= iterating_variable.chr

        end
    end
  end
   new_string = new_string+letter
  end
 return new_string
end
puts "Enter string"
string_to_be_encrypted = gets.chomp
puts "Enter encryption key"
encryption_key = gets.chomp
if encryption_key==0
  "Please enter a positive integer as the encryption key"
end
encrypted=caesar_cipher(string_to_be_encrypted,encryption_key)
puts encrypted
