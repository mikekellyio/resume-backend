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
      get :index, {}, valid_session
      expect(assigns(:jobs)).to eq([job])
    end
  end

  describe "GET #show" do
    it "assigns the requested job as @job" do
      job = Job.create! valid_attributes
      get :show, {:id => job.to_param}, valid_session
      expect(assigns(:job)).to eq(job)
    end
  end

  describe "GET #new" do
    it "assigns a new job as @job" do
      get :new, {}, valid_session
      expect(assigns(:job)).to be_a_new(Job)
    end
  end

  describe "GET #edit" do
    it "assigns the requested job as @job" do
      job = Job.create! valid_attributes
      get :edit, {:id => job.to_param}, valid_session
      expect(assigns(:job)).to eq(job)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Job" do
        expect {
          post :create, {:job => valid_attributes}, valid_session
        }.to change(Job, :count).by(1)
      end

      it "assigns a newly created job as @job" do
        post :create, {:job => valid_attributes}, valid_session
        expect(assigns(:job)).to be_a(Job)
        expect(assigns(:job)).to be_persisted
      end

      it "redirects to the created job" do
        post :create, {:job => valid_attributes}, valid_session
        expect(response).to redirect_to(Job.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved job as @job" do
        post :create, {:job => invalid_attributes}, valid_session
        expect(assigns(:job)).to be_a_new(Job)
      end

      it "re-renders the 'new' template" do
        post :create, {:job => invalid_attributes}, valid_session
        expect(response).to render_template("new")
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
        put :update, {:id => job.to_param, :job => new_attributes}, valid_session
        job.reload
        expect(job.title).to eq("Spiffy New Job Title")
      end

      it "assigns the requested job as @job" do
        job = Job.create! valid_attributes
        put :update, {:id => job.to_param, :job => valid_attributes}, valid_session
        expect(assigns(:job)).to eq(job)
      end

      it "redirects to the job" do
        job = Job.create! valid_attributes
        put :update, {:id => job.to_param, :job => valid_attributes}, valid_session
        expect(response).to redirect_to(job)
      end
    end

    context "with invalid params" do
      it "assigns the job as @job" do
        job = Job.create! valid_attributes
        put :update, {:id => job.to_param, :job => invalid_attributes}, valid_session
        expect(assigns(:job)).to eq(job)
      end

      it "re-renders the 'edit' template" do
        job = Job.create! valid_attributes
        put :update, {:id => job.to_param, :job => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested job" do
      job = Job.create! valid_attributes
      expect {
        delete :destroy, {:id => job.to_param}, valid_session
      }.to change(Job, :count).by(-1)
    end

    it "redirects to the jobs list" do
      job = Job.create! valid_attributes
      delete :destroy, {:id => job.to_param}, valid_session
      expect(response).to redirect_to(jobs_url)
    end
  end

end
