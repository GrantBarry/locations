require "test_helper"

class Location::CountryTest < ActiveSupport::TestCase
  context 'validations' do
    should validate_uniqueness_of(:name).case_insensitive
    should validate_presence_of(:name)
    # should normalize(:name).from(" Country name\n").to("Country name")

    should validate_uniqueness_of(:code).case_insensitive
    should validate_presence_of(:code)
    should validate_length_of(:code).is_equal_to(2)
    # should normalize(:code).from(" DE\n").to("de")

    should have_many(:states)
    should have_many(:districts).through(:states)
    should have_many(:cities).through(:states)
  end

  test 'should normalize name' do
    country = Location::Country.new(name: " Country name\n\r ")
    assert_equal 'Country name', country.name
  end

  test 'should normalize code' do
    country = Location::Country.new(code: " DE\n")
    assert_equal 'de', country.code
  end
end
