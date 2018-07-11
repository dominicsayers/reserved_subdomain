class ReservedSubdomain
  RSpec.describe Literal do
    describe '#self.literals' do
      subject { described_class.literals }

      before do
        described_class.instance_variable_set(:@literals, nil)
        allow(ENV).to receive(:[]).with('RESERVED_SUBDOMAIN_PRELOAD').and_return(env_var)
      end

      context 'when the environment variable is set' do
        let(:env_var) { 'true' }

        it { is_expected.to be_an Array }
      end

      context 'when the environment variable is not set' do
        let(:env_var) { nil }

        it { is_expected.to be_nil }
      end
    end

    describe '#self.load_literals' do
      subject { described_class.load_literals }

      it { is_expected.to be_an Array }
    end

    describe '#reserved?' do
      subject(:literal) { described_class.new(subdomain) }

      before { allow(described_class).to receive(:literals).and_return(['foo']) }

      context 'when the subdomain is a member of the literals list' do
        let(:subdomain) { 'foo' }

        it 'is reserved' do
          expect(literal).to be_reserved
        end
      end

      context 'when the subdomain is not a member of the literals list' do
        let(:subdomain) { 'bar' }

        it 'is not reserved' do
          expect(literal).not_to be_reserved
        end
      end
    end

    described_class.load_literals.each do |literal|
      let(:subdomain) { literal }

      it "#{literal} is not reserved by pattern" do
        expect(Pattern.new(subdomain)).not_to be_reserved
      end

      it "#{literal} is not reserved by prefix" do
        expect(Prefix.new(subdomain)).not_to be_reserved
      end
    end
  end
end
