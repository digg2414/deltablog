class PostController < ApplicationController
  getter post = Post.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_post }
  end

  def index
    posts = Post.all
    render "index.ecr"
  end

  def show
    render "show.ecr"
  end

  def new
    render "new.ecr"
  end

  def edit
    render "edit.ecr"
  end

  def create
    post = Post.new post_params.validate!
    if post.save
      redirect_to action: :index, flash: {"success" => "Post has been created."}
    else
      flash[:danger] = "Could not create Post!"
      render "new.ecr"
    end
  end

  def update
    post.set_attributes post_params.validate!
    if post.save
      redirect_to action: :index, flash: {"success" => "Post has been updated."}
    else
      flash[:danger] = "Could not update Post!"
      render "edit.ecr"
    end
  end

  def destroy
    post.destroy
    redirect_to action: :index, flash: {"success" => "Post has been deleted."}
  end

  private def post_params
    params.validation do
      required :title
      required :body
    end
  end

  private def set_post
    @post = Post.find! params[:id]
  end
end
