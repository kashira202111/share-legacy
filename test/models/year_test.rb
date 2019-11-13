require 'test_helper'

class YearTest < ActiveSupport::TestCase
    test "year integer save" do
        year = Year.new({
            year: 2017
        })
        assert year.save, 'Failed to save'
    end

    test "year string save" do
        year = Year.new({
            year: "AAA"
        })
        assert !year.save, 'test Failed, string data saved'
    end

    test "year bool save" do
        year = Year.new({
            year: true
        })
        assert !year.save, 'test Failed, bool data saved'
    end

    test "year conflict save" do
        year = Year.new({
            year: 2017
        })
        year.save

        year = Year.new({
            year: 2017
        })

        assert !year.save, 'test Failed, conflict data saved'
    end

    test "year check Boundary" do
        year = Year.new({
            year: 1948
        })
        assert !year.save, 'test Failed, limit value below'

        year = Year.new({
            year: 2101
        })
        assert !year.save, 'test Failed, limit value over'
    end
  # test "the truth" do
  #   assert true
  # end
end
