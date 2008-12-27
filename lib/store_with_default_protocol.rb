module StoreWithDefaultProtocol
  def store_with_default_protocol(protocol,*fields)
    
  end
end

ActiveRecord::Base.send(:extend,StoreWithDefaultProtocol)