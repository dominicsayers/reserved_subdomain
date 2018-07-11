class ReservedSubdomain
  RSpec.describe Pattern do
    describe '#reserved?' do
      RESERVED_BY_PATTERN = %w[
        tech-support
        tech_support
        v1
        xn--punycode
      ].freeze

      UNRESERVED_BY_PATTERN = %w[
        bar
        foo
        v999
      ].freeze

      context 'when subdomain is reserved' do
        RESERVED_BY_PATTERN.each do |subdomain|
          it "#{subdomain} is expected to be reserved" do
            expect(described_class.new(subdomain)).to be_reserved
          end
        end
      end

      context 'when subdomain is not reserved' do
        UNRESERVED_BY_PATTERN.each do |subdomain|
          it "#{subdomain} is expected not to be reserved" do
            expect(described_class.new(subdomain)).not_to be_reserved
          end
        end
      end
    end
  end
end
