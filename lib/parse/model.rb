# -*- encoding : utf-8 -*-
module Parse
  class Model < Parse::Object

    def initialize(data=nil)
      super(self.class.to_s,data)
    end

    def self.find(object_id)
      find_by_object_id(object_id)
    end

    def self.find_by(query_hash)
      self.new Parse::Query.new(self.to_s).eq(query_hash).first
    end

    def self.method_missing(m, *args, &block)
      if m.to_s.starts_with?('find_by_')
        raise 'unknown find_by signature' unless args.length == 1
        return find_by m.to_s.gsub('find_by_','').camelize(:lower) => args[0]
      end
      super
    end

  end
end
