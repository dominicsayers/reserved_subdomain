RSpec.describe ReservedSubdomain do
  RESERVED_SUBDOMAINS = %w[
    admin
    tech-support
    tech_support
    www
    www-1
    www1
    www_1
    en
    gb
    uk
    xxx
  ].freeze

  UNRESERVED_SUBDOMAINS = %w[
    en-gb
    foobar
    www999
  ].freeze

  context 'when subdomain is reserved' do
    RESERVED_SUBDOMAINS.each do |subdomain|
      it "#{subdomain} is expected not to be reserved" do
        expect(described_class.new(subdomain)).to be_reserved
      end
    end
  end

  context 'when subdomain is not reserved' do
    UNRESERVED_SUBDOMAINS.each do |subdomain|
      it "#{subdomain} is expected not to be reserved" do
        expect(described_class.new(subdomain)).not_to be_reserved
      end
    end
  end
end
