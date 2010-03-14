class Array
  
  def to_container
    map do |ele|
      [yield(ele), ele.id]
    end
  end
  
end
