class ReservedSubdomain
  RSpec.describe File do
    subject(:file) { described_class.new }

    describe '#literals=' do
      it 'sorts and deduplicates the supplied list' do
        file.literals = %w[foo bar foo bar baz]
        expect(file.literals).to eq(%w[bar baz foo])
      end
    end

    describe '#save' do
      before do
        handle = Struct.new(:write).new
        allow(::File).to receive(:open).and_return([handle])
      end

      it 'returns the object' do
        expect(file.save).to be_a(described_class)
      end
    end

    describe '#dedupe!' do
      it 'returns the object' do
        expect(file.dedupe!([])).to be_a(described_class)
      end

      it 'removes the supplied items from the literals list' do
        file.literals = %w[bar baz foo qux]
        expect(file.dedupe!(%w[baz qux]).literals).to eq(%w[bar foo])
      end
    end

    describe '#remove_reserved!' do
      before { file.literals = %w[mx4 bar #comment foo www] }

      it 'returns the object' do
        expect(file.remove_reserved!).to be_a(described_class)
      end

      it 'removes the supplied items from the literals list' do
        expect(file.remove_reserved!.literals).to eq(%w[bar foo])
      end
    end

    describe '#self.load' do
      it 'lists the file in the directory' do
        expect(described_class.load).to be_an(Array)
      end
    end
  end
end
