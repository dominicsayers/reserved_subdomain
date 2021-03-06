class ReservedSubdomain
  class Literal
    class << self
      # If the env var is set then we pre-load all the reserved literals into
      # a big array. This makes checking for reserved subdomains quicker but at
      # the expense of keeping the big array in memory.
      #
      # If you're only checking for reserved subdomains when a user creates a
      # new account then it may be better to load the literals from the file
      # each time.
      def literals
        @literals ||= ENV['RESERVED_SUBDOMAIN_PRELOAD'] ? load_literals : nil
      end

      def load_literals
        ReservedSubdomain::File.load('*')
      end
    end

    attr_reader :subdomain

    def initialize(subdomain)
      @subdomain = subdomain
    end

    def reserved?
      literals.include? subdomain
    end

    private

    def literals
      self.class.literals || self.class.load_literals
    end
  end
end
