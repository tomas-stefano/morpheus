## Example class for the TODO

```ruby
   class Product
     include Morpheus::FullTextSearch
   end
```

## Setup

```ruby
    Morpheus.setup(adapter: 'solr', host: 'http://localhost:8983/solr')
```

## Persistence

You can save like ActiveRecord objects:

Using #save:

    product = Product.new(name: 'Injustice')
    product.save

Using #update:

    product.update(name: 'Injustice - Gods Among us')

Using #destroy:

    product.destroy

Using .create:

    Product.create(name: 'God of War')

You can do bulk inserts like:

    Product.import([
      Product.new(name: 'Playstation 3'),
      Product.new(name: 'Xbox')
    ])

## Querying

Then you can search like ActiveRecord objects:

    # Product.where(name: 'Playstation 3').order('name ASC')
    # => #<Morpheus::Relation:0x007ff7bb9666e8 collection=[]>

    # Product.where(name: 'God of War').limit(1)
    # => #<Morpheus::Relation:0x007ff7bb9666e8 collection=[]>

    # Product.where(id: 1..20)
    # => #<Morpheus::Relation:0x007ff7bb9666e8 collection=[]>

## Indexers

Think better about indexers:

    class Product
      include Morpheus::FullTextSearch
    end

The resource will be **products**.