class SchoolsController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  before_filter :get_feeds, :only => [:index, :show]

  # GET /schools
  # GET /schools.json
  def index
    @schools = School.all
    @title = t_meta(:title)

    respond_to do |format|
      format.html do
        begin 
          @resources = get_all_resources
        rescue
          @resources = false
        end
      end
      format.json { render json: @schools }
    end
  end

  # GET /schools/slug
  # GET /schools/slug.json
  def show
    @school = School.find(params[:id])
    @title = @school.name.titleize + " | " + t_meta(:title)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @school }
    end
  end

  # GET /schools/new
  # GET /schools/new.json
  def new
    @school = School.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @school }
    end
  end

  # GET /schools/1/edit
  def edit
    @school = School.find(params[:id])
  end

  # POST /schools
  # POST /schools.json
  def create
    @school = School.new(params[:school])

    respond_to do |format|
      if @school.save
        format.html { redirect_to @school, notice: 'School was successfully created.' }
        format.json { render json: @school, status: :created, location: @school }
      else
        format.html { render action: "new" }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /schools/1
  # PUT /schools/1.json
  def update
    @school = School.find(params[:id])

    respond_to do |format|
      if @school.update_attributes(params[:school])
        format.html { redirect_to @school, notice: 'School was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school = School.find(params[:id])
    @school.destroy

    respond_to do |format|
      format.html { redirect_to schools_url }
      format.json { head :no_content }
    end
  end

  private

    def authenticate
      if !user_signed_in?
        redirect_to new_user_session_path
      end
    end

    def get_feeds
      begin
        @axp_news = RSS::Parser.parse("http://axisphilly.org/project/shuttered-school-buildings/feed/")
        @other_news = RSS::Parser.parse("http://axisphilly.org/project/shuttered-school-buildings/?feed=rss2&post_type=external_post")
        @news = combine_news(@axp_news, @other_news)
      rescue
        @news = false
      end
    end
end
