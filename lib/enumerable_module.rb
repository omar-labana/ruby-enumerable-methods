module Enumerable
  def my_each
    object_type = if instance_of?(Array)
                    self
                  elsif instance_of?(Range)
                    to_a
                  else
                    flatten
                  end
    object_type.size.times do |index|
      yield object_type[index]
    end
  end

  def my_each_with_index
    object_type = if instance_of?(Array)
                    self
                  elsif instance_of?(Range)
                    to_a
                  else
                    flatten
                  end
    object_type.size.times do |index|
      yield object_type[index], index
    end
  end
end
