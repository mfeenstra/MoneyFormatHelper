
describe MoneyFormatHelper do

  before(:context) do

    @numbers = { integer:            10000,
                 neg_integer:        -12324567990,
                 three_digit_int:    100,
                 single_digit_int:   9,
                 huge_int:           1234567890123456780,
                 float:              10000.1,
                 float_big_decimal:  1234567.12345,
                 neg_float:          -123499,
                 single_digit_float: 3.0,
                 small_float:        0.1,
                 small_neg_float:    -0.2,
                 huge_float:         -121312126781.912 }
  end

  after(:context) {}

  describe "formats the numbers in a nice way" do

    describe "with_commas" do
      it "should put a couple commas in a huge float decimal number" do      
        expect(MoneyFormatHelper::with_commas(@numbers[:huge_float]).match?(/\d+,\d+,\d+/)).
          to be(true)
      end
      it "should not do anything for small floats" do
        expect(MoneyFormatHelper::with_commas(@numbers[:small_float]) == @numbers[:small_float].to_s).
          to be(true)
      end
      it "should add commas to a large negative integer" do
        expect(MoneyFormatHelper::with_commas(@numbers[:neg_integer]).to_s.match?(/-?\d+,\d+,\d+,\d+/)).
          to be(true)
      end
    end

    describe "zeropad" do
      it "should add a zero to a both postitive and negative small floats" do
        expect( ( MoneyFormatHelper::zeropad(@numbers[:small_float]).
                    match?(/^\d\.\d\d$/)) &&
                ( MoneyFormatHelper::zeropad(@numbers[:small_neg_float]).
                    match?(/^-\d\.\d\d$/))
              ).to be(true)
      end
    end
  end
end
