class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def roster
    @users = User.all
  end

  def video
  end

private

  def upvote
    @topic = Topic.find(params[:id])
    @topic.votes.create
    redirect_to(topics_path)
  end


end
