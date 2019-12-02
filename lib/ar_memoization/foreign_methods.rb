module ArMemoization
  module ForeignMethods
    def belongs_to_memoized(association_name, scope = nil, **options)
      belongs_to(association_name, scope, options)
      reflection = reflect_on_association(association_name)

      class_eval %Q{
        def #{association_name}
          unless association(:#{association_name}).target
            obj = #{reflection.class_name}.find_memo(#{reflection.foreign_key})
            association(:#{association_name}).writer(obj)
          end
          association(:#{association_name}).target
        end
      }
    end

    # def has_one_memoized(association_name, scope = nil, **options)
    # end

    # def has_many_memoized(association_name, scope = nil, **options, &extension)
    # end

    def where_memoized(association_name, method_name = nil, &block)
      reflection = reflect_on_association(association_name)
      memos = reflection.class_name.constantize.all_memos

      foreign_keys = case
        when method_name
          memos.select(&method_name)
        when block_given?
          memos.select(&block)
        else
          []
        end.map(&:id)

      where(reflection.foreign_key => foreign_keys)
    end
  end
end
