module StoreWithDefaultProtocol
  def store_with_default_protocol(protocol,*columns)
    columns.each do |column|
      setter = "#{column}="
      #we add a default setter if non-exists, just to play nice with other plugins...
      unless instance_methods.include?(setter)
        class_eval <<END
          def #{setter}(value)
            write_attribute(:#{column},value)
          end
END
      end

      #alias_method_chain the setter...
      class_eval <<END
        def #{column}_with_default_protocol=(value)
          if value and not value.blank? and not value.include?('://')
            value = "#{protocol}://"+value.to_s
          end
          self.#{column}_without_default_protocol = value
        end
        alias_method_chain :#{setter}, :default_protocol
END
    end
  end
end

ActiveRecord::Base.send(:extend,StoreWithDefaultProtocol)