require 'rails_helper'

RSpec.describe Api::V1::BookingsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/bookings').to route_to({"format"=>"json", "controller"=>"api/v1/bookings", "action"=>"index"})
    end

    it 'routes to #create' do
      expect(post: 'api/v1/bookings').to route_to({"format"=>"json", "controller"=>"api/v1/bookings", "action"=>"create"})
    end

    it 'routes to #update via PUT' do
      expect(put: 'api/v1/bookings/1').to route_to({"format"=>"json", "controller"=>"api/v1/bookings", "action"=>"update", "id"=>"1"})
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'api/v1/bookings/1').to route_to({"format"=>"json", "controller"=>"api/v1/bookings", "action"=>"update", "id"=>"1"})
    end

    it 'routes to #destroy' do
      expect(delete: 'api/v1/bookings/1').to route_to({"format"=>"json", "controller"=>"api/v1/bookings", "action"=>"destroy", "id"=>"1"})
    end
  end
end