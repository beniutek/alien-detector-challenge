RSpec.describe Radar do
  describe 'each_frame' do
    let(:sample) {{ content: '123456789', height: 3, width: 3 }}
    let(:radar) { described_class.new(sample) }

    it 'iterates only if it has space to do so' do
      count = 0

      radar.each_frame(2, 2) do |_, index|
        count += 1
      end

      expect(count).to eq(4)
    end
  end
end
