module AttributeListClass
  public
  def attr_list
    @@attr_list
  end

  def attr_accessor_with_list(*attrs)
    @@attr_list ||= Array.new
    attrs.each do |attr|
      @@attr_list << attr.to_s
      class_eval %Q{
	    def #{attr}
	      @#{attr}
	    end
	    def #{attr}=(value)
	      @#{attr} = value
	    end
      }
    end
  end
end