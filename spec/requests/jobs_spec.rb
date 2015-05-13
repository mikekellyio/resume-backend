require 'rails_helper'

RSpec.describe "Jobs", type: :request do
  describe "GET /jobs" do
    it "works!" do
      get jobs_path, format: :json
      expect(response).to have_http_status(200)
    end
  end
end
