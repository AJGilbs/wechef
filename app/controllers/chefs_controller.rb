class ChefsController < ApplicationController



before_action :authenticate_chef!, except: [:index, :show, :search]
before_action :find_chef, only: [:create, :edit, :update, :show]



def index #should show only 6 randon chefs
  @chefs = policy_scope(Chef)
end

def show
  @booking = Booking.new
  authorize(@chef)
  authorize(@booking)
end

def search
  date = Date.parse(params[:date])
  @chefs = Chef.where.not(id: Booking.where(date: date).pluck('chef_id'))
  # chefs = Chef.joins('LEFT OUTER JOIN bookings ON bookings.chef_id = chefs.id').where('date != ?', date)
  authorize(@chefs)
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
