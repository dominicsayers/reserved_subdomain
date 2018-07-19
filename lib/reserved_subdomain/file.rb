class ReservedSubdomain
  class File
    DIRECTORY = ::File.join(__dir__, 'literals')

    class << self
      def load(fileroot = '*')
        new(fileroot).literals
      end
    end

    attr_reader :fileroot, :literals

    def initialize(fileroot = '*')
      @fileroot = fileroot
      @literals = files.map { |filename| ::File.read(filename).split("\n") }.compact.flatten
    end

    def literals=(list)
      @literals = list.sort.uniq
    end

    def save
      ::File.open(files.first, 'w') { |f| f.write literals.join("\n") }
      self
    end

    def dedupe!(content)
      literals.reject! { |literal| content.include?(literal) }
      self
    end

    def remove_reserved!
      literals.reject! do |literal|
        (literal =~ /^#/) ||
          ReservedSubdomain::Prefix.new(literal).reserved? ||
          ReservedSubdomain::Pattern.new(literal).reserved?
      end

      self
    end

    private

    def files
      Dir.glob(::File.join(DIRECTORY, "#{fileroot}.txt"))
    end
  end
end
