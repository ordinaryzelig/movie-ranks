class Tag < ActiveRecord::Base
  
  has_and_belongs_to_many :movies
  
  named_scope :by_name, :order => :name
  
  def to_param
    name
  end
  
  # like find with raising exception, but for name.
  def self.find_by_name!(*args)
    name = args.shift
    tag = Tag.find_by_name(name, *args)
    raise TagNotFound.new(name) unless tag
    tag
  end
  
  # like ActiveRecord::RecordNotFound, but for tag name.
  class TagNotFound < ActiveRecord::RecordNotFound
    attr_reader :tag_name
    def initialize(tag_name, msg = nil)
      @tag_name = tag_name
      super msg || "Couldn't find Tag with name='#{tag_name}'"
    end
  end
  
end
