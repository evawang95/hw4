class PostsController < ApplicationController

  def new
    @post = Post.new
    @post.place_id = params["place_id"]
  end

  def create
    @post = Post.new
    @post["title"] = params["post"]["title"]
    @post["description"] = params["post"]["description"]
    @post["posted_on"] = params["post"]["posted_on"]
    @post["place_id"] = params["post"]["place_id"]
    @post.save
    redirect_to "/places/#{@post["place_id"]}"
  end
  
  def update
    @post = Post.find_by({ "id" => params["id"] })
    if @current_user
      @company["name"] = params["company"]["name"]
      @company["city"] = params["company"]["city"]
      @company["state"] = params["company"]["state"]
      @company.save
    else
      flash["notice"] = "You must be logged in."
    end
    redirect_to "/companies/#{@company["id"]}"
  end
 
end
