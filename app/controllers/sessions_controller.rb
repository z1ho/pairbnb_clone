class SessionsController < ApplicationController
  # def index                   #has a view page
  # end
  #
  # def show                   #has a view page
  # end
  #
  # def create
  # end
  #
  # def new                    #has a view page
  # end
  #
  # def edit                   #has a view page
  # end
  #
  # def update
  # end
  #
  # def destroy
  # end
  def url_after_create
    static_home_path
  end
end
