require 'rails_helper'

RSpec.describe JobsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Job. As you add validations to Job, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {title: "Spiffy Job Title", company: "Some company", started_at: 1.day.ago, location: "Anytown, USA"}
  }

  let(:invalid_attributes) {
    {title: nil, company: nil, started_at: nil, location: nil}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # JobsController. Be sure to keep this updated too.
  let(:valid_session) { {format: :json} }

  describe "GET #index" do
    it "assigns all jobs as @jobs" do
      job = Job.create! valid_attributes
      get :index, valid_session
      expect(assigns(:jobs)).to eq([job])
    end
  end

  describe "GET #show" do
    it "assigns the requested job as @job" do
      job = Job.create! valid_attributes
      get :show, valid_session.merge({:id => job.to_param})
      expect(assigns(:job)).to eq(job)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Job" do
        expect {
          post :create, valid_session.merge({:job => valid_attributes})
        }.to change(Job, :count).by(1)
      end

      it "assigns a newly created job as @job" do
        post :create, valid_session.merge({:job => valid_attributes})
        expect(assigns(:job)).to be_a(Job)
        expect(assigns(:job)).to be_persisted
      end

    end

    context "with invalid params" do
      it "assigns a newly created but unsaved job as @job" do
        post :create, valid_session.merge({:job => invalid_attributes})
        expect(assigns(:job)).to be_a_new(Job)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {title: "Spiffy New Job Title", company: "Some company", started_at: 1.day.ago, location: "Anytown, USA"}
      }

      it "updates the requested job" do
        job = Job.create! valid_attributes
        put :update, valid_session.merge({:id => job.to_param, :job => new_attributes})
        job.reload
        expect(job.title).to eq("Spiffy New Job Title")
      end

      it "assigns the requested job as @job" do
        job = Job.create! valid_attributes
        put :update, valid_session.merge({:id => job.to_param, :job => valid_attributes})
        expect(assigns(:job)).to eq(job)
      end
    end

    context "with invalid params" do
      it "assigns the job as @job" do
        job = Job.create! valid_attributes
        put :update, valid_session.merge({:id => job.to_param, :job => invalid_attributes})
        expect(assigns(:job)).to eq(job)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested job" do
      job = Job.create! valid_attributes
      expect {
        delete :destroy, valid_session.merge({:id => job.to_param})
      }.to change(Job, :count).by(-1)
    end
  end

end
