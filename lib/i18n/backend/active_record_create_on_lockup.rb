require 'active_record'

module I18n
  module Backend
    class ActiveRecordCreateOnLockup < ActiveRecord
    
      module Implementation

        def lookup(locale, key, scope = [], options = {})
          result = super(locale, key, scope, options)
          unless result
            puts "--- Creating translation #{locale} | #{key}"
          
            Translation.create(locale: locale, key: key, value: "Translation missing #{locale} | #{key}")
          end
          "Translation missing #{locale} | #{key}"
        end
      end

      include Implementation
    end
  end
end

