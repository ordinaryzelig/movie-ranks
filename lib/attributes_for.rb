class Object
  
  # convert results of calling methods into attributes hash.
  # e.g. Date.today.attributes_for(:day, :month, :year) would return
  # {:day => 13, :month => 3, :year => 2010}
  def attributes_for(*method_names)
    method_names.inject({}) do |hash, method_name|
      hash[method_name] = send(method_name)
      hash
    end
  end
  
end

if $0 == __FILE__
  int = 4
  raise 'dang it' unless {:to_s => '4', :succ => 5} == int.attributes_for(:to_s, :succ)
end
