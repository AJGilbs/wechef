class ChefsController < ApplicationController
before_action :authenticate_chef!, except: [:index, :show]
before_action :find_chef, only: [:create, :edit, :update, :show]

def index
  @chefs = policy_scope(Chef)
end

def new
  @chef = Chef.new
  authorize(@chef)
end

def create
  @chef = find_chef
  authorize(@chef)
  if @chef.save
    redirect_to chef_path(@chef)
  else
    render "new"
  end
end

def show
  authorize(@chef)
end

def edit
  authorize(@chef)
end

def update
  authorize(@chef)
  if @chef.update(chef_params)
    redirect_to chef_path(@chef)
  else
    render "edit"
  end
end

private


def find_chef
  @chef = Chef.find(params[:id])
end

def chef_params
  params.require(:chef).permit(:name, :addres, :phone_number, :experience, :photo, :description)
end

end
