require 'reserved_subdomain/file'
require 'reserved_subdomain/literal'
require 'reserved_subdomain/pattern'
require 'reserved_subdomain/prefix'

class ReservedSubdomain
  attr_reader :subdomain

  def initialize(subdomain)
    @subdomain = subdomain
  end

  def reserved?
    Prefix.new(subdomain).reserved? || Pattern.new(subdomain).reserved? || Literal.new(subdomain).reserved?
  end
end
