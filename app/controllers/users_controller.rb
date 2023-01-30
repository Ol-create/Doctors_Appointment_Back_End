class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok
  end

  # POST /users
  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:id] = @user.id
      payload = { user_id: @user.id }
      token = encode_token(payload)
      render json: { user: @user, jwt: token }
    else
      render json: { status: 'error', errors: @user.errors.full_messages }
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:name, :email)
  end
end
