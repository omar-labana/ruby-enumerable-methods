module Enumerable
  def my_each
    object_type = if instance_of?(Array)
                    self
                  elsif instance_of?(Range)
                    to_a
                  else
                    flatten
                  end
    object_type.size.times do |i|
      yield object_type[i]
    end
  end
end
