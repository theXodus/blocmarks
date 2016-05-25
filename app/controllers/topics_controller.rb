class TopicsController < ApplicationController

  before_action :find_topic, except: [:index, :new, :create]

  def index
    @topics = Topic.all
  end

  def show
    @bookmarks = @topic.bookmarks.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.build(topic_params)

    if @topic.save
      flash[:notice] = "Topic Created! Start blocmarking!"
      redirect_to root_path
    else
      flash[:notice] = "Failed to create topic."
      render :new
    end
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to(@topic)
    else
      render :edit
    end
  end

  def destroy
    if @topic.destroy
      redirect_to root_path
    else
      render 'show'
    end
  end

  private

  def find_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title)
  end
end
