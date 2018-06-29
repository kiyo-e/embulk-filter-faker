require "ffaker"

module Embulk
  module Filter

    class Faker < FilterPlugin
      
      Plugin.register_filter("faker", self)

      def self.transaction(config, in_schema, &control)
        task = {
          'columns' => config.param('columns', :array, default: [])
        }
        yield(task, in_schema)
      end

      def init
        # initialization code:
        @columns = task["columns"]
      end

      def close
      end

      def add(page)
        # filtering code:
        page.each do |record|
          page_builder.add set_value(record)
        end
      end

      def finish
        page_builder.finish
      end

      private

      def set_value(record)
        @columns.each do |c|
          c.each_pair do |k, v|
            i = find_index(k)
            next unless i
            next if record[i].nil? || record[i] == ""

            record[i] = make_dummy_data(v) 
          end
        end

        record
      end

      def find_index(k)
        out_schema.index { |e| e['name'] == k }
      end

      def make_dummy_data(type)
        case type.to_sym
        when :name
          p FFaker::NameJA.unique.name
        when :email
          FFaker::Internet.unique.email
        when :tel
          FFaker.numerify "#{['0####-#-####', '0###-##-####', '0##-###-####', '0#-####-####'].sample}"
        else
          # none
        end
      end
    end

  end
end
