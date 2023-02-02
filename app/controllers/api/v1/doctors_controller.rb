class Api::V1::DoctorsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_actions

  def index
    doctors = Doctor.all
    render json: { doctors: }
  end

  def create
    doctor = Doctor.new(doctor_params)
    if doctor.save
      render json: { result: 'success', doctor: }
    else
      render json: { result: 'failed', error: doctor.errors }, status: :unprocessable_entity
    end
  end

  def update
    doctor = Doctor.find(params[:id])
    if doctor.update(doctor_params)
      render json: { result: 'success', doctor: }
    else
      render json: { result: 'failed', error: doctor.errors }, status: :unprocessable_entity
    end
  end

  def show
    doctor = Doctor.find(params[:id])
    render json: { doctor: }
  end

  def destroy
    doctor = Doctor.find(params[:id])
    doctor.destroy
    render json: { result: 'success' }
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :phone, :email, :location, :rates, :bio, :avatar)
  end
end

def authorize_actions
  authorize :doctors_controller, except: %i[index show]
end
