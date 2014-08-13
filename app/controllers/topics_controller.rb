class TopicsController < ApplicationController

def index
  @topics = Topic.all
end

def show 

end

private

  def upvote
    @topic = Topic.find(params[:id])
    @topic.votes.create
    redirect_to(topics_path)
  end

end
