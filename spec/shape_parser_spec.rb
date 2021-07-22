RSpec.describe ShapeParser do
  describe 'parse' do
    subject { described_class.new(Sample.get_squid_alien).parse }

    let(:expected) {{
        content: '---oo-----oooo---oooooo-oo-oo-oooooooooo--o--o---o-oo-o-o-o--o-o',
        height: 8,
        width: 8,
    }}

    it { is_expected.to eq(expected) }
  end
end
