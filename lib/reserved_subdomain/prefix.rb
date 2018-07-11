class ReservedSubdomain
  class Prefix
    PREFIXES = %w[
      db
      dc
      dev
      dns
      ftp
      host
      mail
      mx
      ns
      ntp
      server
      smtp
      static
      support
      test
      vpn
      web
      www
    ].freeze

    attr_reader :subdomain

    def initialize(subdomain)
      @subdomain = subdomain
    end

    def reserved?
      PREFIXES.any? { |prefix| Prefix.new(prefix, subdomain).reserved? }
    end

    class Prefix
      def initialize(prefix, subdomain)
        @prefix = prefix
        @subdomain = subdomain
      end

      def reserved?
        @subdomain =~ regex
      end

      private

      def regex
        /^#{@prefix}[-_]*[0-9]{,2}$/
      end
    end
  end
end
