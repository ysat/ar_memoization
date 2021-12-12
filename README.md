Qiita: https://qiita.com/ysat/items/d8a1590891b472cc60d3

# ar_memoization
ArMemoization is a library for memoize ActiveRecord objects and search there.

This library has two modules.

* ArMemoization::PrimaryMethods
* ArMemoization::ForeignMethods

```PrimaryMethods``` module contains methods to memoize Model instances.  
This module is used for the Model of a table that hardly changes data.

```ForeignMethods``` module contains methods that handle the memoized data of the Model using ```PrimaryMethods```.  
This module is used in the Model that belongs_to the Model that uses ```PrimaryMethods```.

## example

migration
```ruby
class CreateAllTables < ActiveRecord::Migration[5.0]
  def self.up
    create_table(:countries) do |t|
      t.string :name
    end

    create_table(:shops) do |t|
      t.belongs_to :country
      t.string :name
    end
  end
end
```

app/models/country.rb
```ruby
class Country < ActiveRecord::Base
  extend ArMemoization::PrimaryMethods
end
```

app/models/shop.rb
```ruby
class Shop < ActiveRecord::Base
  extend ArMemoization::ForeignMethods
  belongs_to_memoized :country
end
```
