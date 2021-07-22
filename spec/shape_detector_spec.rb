RSpec.describe ShapeDetector do
  describe 'detect' do
    let(:shape) {{ content: "000---", width: 3, height: 2 }}
    let(:frame) { "000---" }

    subject { described_class.new(shape).detect(frame) }

    context 'sensitivity score is matched' do
      let(:expected) {{ score: 100, frame: frame }}

      it { is_expected.to eq(expected) }
    end

    context 'sensitivity is too strict' do
      let(:frame) { "---000" }
      let(:expected) {{ score: 0, frame: nil }}

      it { is_expected.to eq(expected) }
    end

    context 'rubbish is passed to the detector' do
      let(:frame) { "0" }

      let(:expected) {{ score: 0, frame: nil }}

      it { is_expected.to eq(expected) }
    end
  end
end
