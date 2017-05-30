require 'spec_helper'

describe FbGraph2::Edge::Achievements do
  context 'included in User' do
    describe '#achievements' do
      let(:me) { FbGraph2::User.me('token') }
      it 'should return an Array of FbGraph2::Achievement' do
        achievements = mock_graph :get, 'me/achievements', 'user/achievements', access_token: 'token' do
          me.achievements
        end
        achievements.should be_instance_of FbGraph2::Edge
        achievements.should_not be_blank
        achievements.each do |achievement|
          achievement.should be_instance_of FbGraph2::Achievement
        end
      end
    end
  end
end