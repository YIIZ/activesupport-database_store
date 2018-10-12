# ActiveSupport::Cache::DatabaseStore
for Rails5


## Usage
Add to your Gemfile
```
gem 'activesupport-database_store', github: 'yiiz/activesupport-database_store'
```

Create `stores` table by `rails g migration create_stores`
```
def change
  create_table :stores, id: false do |t|
    t.string :key, null: false
    t.binary :entry
  end
  add_index :stores, :key, unique: true
end
```

Config `config/application.rb`
```
config.cache_store = :database_store
```


## TODO
- generator migration task
- implement all store methods
- custom table name
