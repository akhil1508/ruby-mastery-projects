module Enumerable
  def my_each
    self.length.times do |index|
       yield(self[index])

    end
    self
  end
  def my_each_with_index
    self.length.times do |index|
       yield(self[index],index)

    end
    self
  end
  def my_select
   self.length.times do |index|
     yield(self[index])
   end
  end
  def my_all?
    value = nil
    self.my_each do |element|
      if yield(element)
        value = true
      else
        value = false
        break
      end
    end
      value
    end
  def my_any?
    value = nil
    self.my_each do |element|
      if yield(element)
        value = true
        break
      else
        value = false
      end
    end
      value
    end
  def my_none?
    value = nil
    if self == nil
      return true
    else
      self.my_each do |element|
        if yield(element)== false
         value = true
      else
        value = false
        break
      end
      end
      if value == true
        return true
      else
        return false
      end
    end
  end
def my_count
  count = 0
  if self.length == 0
    count = 0
  else
   self.my_each do |element|
       if yield(element)
         count+=1
       end
     end
   end
   return count
 end
 def my_map (&this_proc)

  self.my_each_with_index do |element,index|
      self[index] = this_proc.call(element)
   end
  return self
 end
 def my_inject(initial_value = 0, sym = nil)
    unless sym
      self.my_each do |element|
        initial = yield(initial, element)
      end
    else
      self.my_each do |element|
        initial = initial.method(sym).call(element)
      end
    end
    return initial_value
end

end
