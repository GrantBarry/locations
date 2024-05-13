require "test_helper"

class Location::StateTest < ActiveSupport::TestCase
  should validate_uniqueness_of(:name).scoped_to(:location_country_id).case_insensitive
  should validate_presence_of(:name)

  should have_many(:cities)
  should have_many(:districts)

  should belong_to(:country).class_name('Location::Country').with_foreign_key(:location_country_id)
  test 'should normalize name' do
    state = Location::State.new(name: " State name\n\r ")
    assert_equal 'State name', state.name
  end
  test 'should normalize abbreviation' do
    state = Location::State.new(abbreviation: " NSW\n")
    assert_equal 'NSW', state.abbreviation
  end
end
