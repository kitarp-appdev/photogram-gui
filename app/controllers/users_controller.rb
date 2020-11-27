class UsersController < ApplicationController
  def index
    matching_users = User.all
    
    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb" })
  end

  def show
    # Parameters: {"path_username"=>"anisa"}
    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.at(0)

    # if @the_user == nil
    #   redirect_to("/404")
    # else
      render({ :template => "user_templates/show.html.erb" })
    # end
  end

  def create
    
    input_username = params.fetch("input_username")
    user = User.new({ :username => input_username })
    user.save
    matching_usernames = User.where({ :username => input_username })
    @the_user = matching_usernames.at(0)
    render({ :template => "user_templates/show.html.erb"})
  end

  def update
    input_username = params.fetch("input_username")
    url_username = params.fetch("url_user")
    matching_usernames = User.where({ :username => url_username })
    @the_user = matching_usernames.at(0)
    m = User.where({ :username => url_username }).first
    m.username = input_username
    m.save
    matching_usernames = User.where({ :username => input_username })
    @the_user = matching_usernames.at(0)
    render({ :template => "user_templates/show.html.erb"})
  end
end