require 'rails_helper'

RSpec.describe IncomingController, type: :controller do

  @parameters = { "to"=>"<#{ hellomyblocmarks.com }>",
                  "from"=>"#{ Faker::Internet.email }",
                  "subject"=>"Topic",
                  "plain"=>"url.com"
                }

  describe "GET #create" do
    it "create topic from subject" do
      post "/incoming", @parameters
      expect(Topic.count).to c
    end
  end

end
