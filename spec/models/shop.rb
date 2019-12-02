class Shop < ActiveRecord::Base
  extend ArMemoization::ForeignMethods
  belongs_to_memoized :prefecture
end
