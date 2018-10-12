module ActiveSupport
  module Cache
    class DatabaseStore < Store
      class Store < ActiveRecord::Base
        self.primary_key = 'key'
      end

      def clear(options = nil)
        Store.delete_all
      end

      # def cleanup(options = nil)
      # end

      # def increment(name, amount = 1, options = nil)
      # end

      # def decrement(name, amount = 1, options = nil)
      # end

      # def delete_matched(matcher, options = nil)
      # end

      private
        def read_entry(key, options)
          entry = Store.where(key: key).limit(1).pluck(:entry).first
          return if entry.nil?
          Marshal.load(entry)
        end

        def write_entry(key, entry, options)
          return false if options[:unless_exist] && Store.exist?(key)
          store = Store.find_or_initialize_by(key: key)
          store.entry = Marshal.dump(entry)
          store.save
        end

        def delete_entry(key, options)
          Store.where(key: key).delete_all
          true
        end
    end
  end
end
