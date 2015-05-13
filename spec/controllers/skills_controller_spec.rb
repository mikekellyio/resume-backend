require 'rails_helper'

RSpec.describe SkillsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Skill. As you add validations to Skill, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {title: "my skill"}
  }

  let(:invalid_attributes) {
    {title: nil}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SkillsController. Be sure to keep this updated too.
  let(:valid_session) { {format: :json} }

  describe "GET #index" do
    it "assigns all skills as @skills" do
      skill = Skill.create! valid_attributes
      get :index, {}.merge(valid_session)
      expect(assigns(:skills)).to eq([skill])
    end
  end

  describe "GET #show" do
    it "assigns the requested skill as @skill" do
      skill = Skill.create! valid_attributes
      get :show, {:id => skill.to_param}.merge(valid_session)
      expect(assigns(:skill)).to eq(skill)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Skill" do
        expect {
          post :create, {:skill => valid_attributes}.merge(valid_session)
        }.to change(Skill, :count).by(1)
      end

      it "assigns a newly created skill as @skill" do
        post :create, {:skill => valid_attributes}.merge(valid_session)
        expect(assigns(:skill)).to be_a(Skill)
        expect(assigns(:skill)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved skill as @skill" do
        post :create, {:skill => invalid_attributes}.merge(valid_session)
        expect(assigns(:skill)).to be_a_new(Skill)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {title: "new title"}
      }

      it "updates the requested skill" do
        skill = Skill.create! valid_attributes
        put :update, {:id => skill.to_param, :skill => new_attributes}.merge(valid_session)
        skill.reload
        expect(skill.title).to eq("new title")
      end

      it "assigns the requested skill as @skill" do
        skill = Skill.create! valid_attributes
        put :update, {:id => skill.to_param, :skill => valid_attributes}.merge(valid_session)
        expect(assigns(:skill)).to eq(skill)
      end
    end

    context "with invalid params" do
      it "assigns the skill as @skill" do
        skill = Skill.create! valid_attributes
        put :update, {:id => skill.to_param, :skill => invalid_attributes}.merge(valid_session)
        expect(assigns(:skill)).to eq(skill)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested skill" do
      skill = Skill.create! valid_attributes
      expect {
        delete :destroy, {:id => skill.to_param}.merge(valid_session)
      }.to change(Skill, :count).by(-1)
    end
  end

end
