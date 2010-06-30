class UserController < ApplicationController
  before_filter :login_required, :except=>[:login, :forgot_password, :send_password]
  before_filter :admin_required, :only=>[:destroy, :new, :create]
  
  layout "horas"
  
  def login
    unless params[:user].blank?
      if session[:user] = User.authenticate(params[:user][:login], params[:user][:password])
        redirect_to :controller=>'hora'
        flash[:notice]=''
      else
        flash[:notice]="login ou senha incorreta"
      end
    end
  end

  def logout
    session[:user] = nil
    redirect_to :action=>:login
  end

  def forgot_password
  end
  
  def send_password
    u= User.find_by_email(params[:user][:email])
    if u and u.send_new_password
      flash[:notice]  = "A new password has been sent by email."
      redirect_to :action=>'login'
    else
      flash[:notice]  = "No user matches this e-mail. Contact kaue.sanchez@nudesign.com for further info"
      render :action=>'forgot_password'
    end
  end
  
  def index
    @users = User.all
    redirect_to :controller=>'hora'  if session[:user].role != User::ADMIN
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to :action=>'index'
    else
      render :action=>'new'
    end
  end

  
  def edit
    @user = User.find(params[:id])
    redirect_to login_path if session[:user].role != User::ADMIN && session[:user]!=@user
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to :action=>"index"
    else
      render :action=>"edit"
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :action=>'index'
  end
end
