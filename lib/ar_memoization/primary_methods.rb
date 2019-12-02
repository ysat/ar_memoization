module ArMemoization
  module PrimaryMethods
    def find_memo(ident)
      ar_memoization_memoized_table[ident.to_i]
    end

    def detect_memo(&block)
      all_memos.detect(&block)
    end

    def select_memos(&block)
      all_memos.select(&block)
    end

    def all_memos
      ar_memoization_memoized_table.values
    end

    def reload_memos
      ar_memoization_memoized_table(reload: true)
      all_memos
    end

    def ar_memoization_memoized_table(reload: false)
      if reload || @ar_memoization_memoized_table.nil?
        @ar_memoization_memoized_table = all.index_by(&:id)
      end
      @ar_memoization_memoized_table
    end
  end
end
