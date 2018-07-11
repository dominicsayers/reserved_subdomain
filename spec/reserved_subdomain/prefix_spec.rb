class ReservedSubdomain
  RSpec.describe Prefix do
    describe '#reserved?' do
      RESERVED_BY_PREFIX = %w[
        db
        db9
        db99
        db-9
        db_9
      ].freeze

      UNRESERVED_BY_PREFIX = %w[
        db999
      ].freeze

      context 'when subdomain is reserved' do
        RESERVED_BY_PREFIX.each do |subdomain|
          it "#{subdomain} is expected not to be reserved" do
            expect(described_class.new(subdomain)).to be_reserved
          end
        end
      end

      context 'when subdomain is not reserved' do
        UNRESERVED_BY_PREFIX.each do |subdomain|
          it "#{subdomain} is expected not to be reserved" do
            expect(described_class.new(subdomain)).not_to be_reserved
          end
        end
      end
    end
  end
end
