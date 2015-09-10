require './test/test_helper'

class InstagramServiceTest < ActiveSupport::TestCase
  attr_reader :service

  def setup
    @service = InstagramService.new
  end

  # test '#legislators' do
  #   VCR.use_cassette('sunlight_service_test#legislators') do
  #     legislators = service.legislators(gender: 'F')
  #     legislator = legislators.first
  #     assert_equal 20, legislators.count
  #     assert_equal "Joni", legislator[:first_name]
  #     assert_equal "Ernst", legislator[:last_name]
  #   end
  # end
  #
  # test '#committees' do
  #   VCR.use_cassette('sunlight_service_test#committees') do
  #     committees = service.committees(chamber: 'senate')
  #     committee = committees.first
  #     assert_equal 20, committees.count
  #     assert_equal "SSGA19", committee[:committee_id]
  #     assert_equal "Regulatory Affairs and Federal Management", committee[:name]
  #   end
  # end
end