class ReservedSubdomain
  class Pattern
    PATTERNS = [
      /.*[_-]feed$/,
      /.*[_-]support$/,
      /^v[0-9]{,2}$/,
    ].freeze

    attr_reader :subdomain

    def initialize(subdomain)
      @subdomain = subdomain
    end

    def reserved?
      PATTERNS.any? { |pattern| subdomain =~ pattern }
    end
  end
end
