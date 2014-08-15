class BlogsController < ApplicationController
  #Use a specific blogs layout view to styleize blog pages
  #layout "blogs"

  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  #Displays a list of all project and event blogs
  def index
    @bloggable = find_bloggable
    @blogs = @bloggable.blogs
  end

  #Shows a specific project or event blog
  def show
  end

  #Creates a new project or event blog
  def new
    @blog = Blog.new

    #Needed to authorize CanCan ?????
    #authorize! :new, @blog
  end

  def edit
  end

  def create
    @bloggable = find_bloggable
    @blog = @bloggable.blogs.build(blog_params)

    #Person who creates the blog is a owner
    #@blog.users.append(current_user)
    #@user = current_user

    respond_to do |format|
      if @blog.save
        format.html { redirect_to [@user, @blog], notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to [current_user, @blog], notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :description, :content, :user_ids => [])
    end

    def find_bloggable
      params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.friendly.find(value)
        end
      end

    end

end
