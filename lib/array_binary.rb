module ArrayBinary
  
  def midpoint
    return nil if empty?
    (size / 2)
  end
  
  def first_half
    self[0...midpoint]
  end
  
  def last_half
    self[midpoint..-1]
  end
  
end
