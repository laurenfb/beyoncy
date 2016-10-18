class AddressesController < ApplicationController
  before_action :find_address, except: [:index, :new, :create]
  before_action :not_found, except: [:index, :new, :create]


  def index
    @addresses = Address.all
  end

  def show
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to # UNKNOWN
    else
      render # UNKNOWN
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to # UNKNOWN
    else
      render # UNKNOWN
    end
  end

  def destroy
    @address.destroy
    redirect_to root_path
  end




  private
  def find_address
    @address = Address.find(params[:id])
    if !@address.nil?
      render :file => 'public/404.html', :status => :not_found
    end
  end

  def address_params
    params.require(:address).permit(:kind, :first_name, :last_name, :street1, :street2, :city, :state, :zip, :country, :phone)
  end

end
