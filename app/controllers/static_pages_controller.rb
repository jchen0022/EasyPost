class StaticPagesController < ApplicationController
  require 'easypost'
  EasyPost.api_key = '9La5mw88klXUZJwieDFhhA'

  def home
    @label = Label.new
    if not params.has_key?(:info)
      @filled_form = false
    else
      info = label_params
      @label = Label.new(info)
      if not @label.valid?
        @label.errors.each do |attribute, message|
          flash.now[:danger] = message
        end
        @filled_form = false
      else
        to_address = EasyPost::Address.create(
          :name => @label.to_name,
          :street1 => @label.to_street1,
          :street2 => @label.to_street2,
          :city => @label.to_city,
          :state => @label.to_state,
          :zip => @label.to_zip
        )

        from_address = EasyPost::Address.create(
          :name => @label.from_name,
          :street1 => @label.from_street1,
          :street2 => @label.from_street2,
          :city => @label.from_city,
          :state => @label.from_state,
          :zip => @label.from_zip
        )

        parcel = EasyPost::Parcel.create(
          :width => @label.width,
          :length => @label.length,
          :height => @label.height,
          :weight => @label.weight
        )

        shipment = EasyPost::Shipment.create(
          :to_address => to_address,
          :from_address => from_address,
          :parcel => parcel
        )

        shipment.buy(
          :rate => shipment.lowest_rate
        )
        
        shipment.insure(amount: 100)

        @shipment_url = shipment.postage_label.label_url
        @filled_form = true
      end
    end
  end

  def is_num?(str)
    !!Float(str)
  rescue ArgumentError, TypeError
    false
  end

  def label_params
    params.require(:info).permit(:from_name, :from_street1, :from_street2, :from_city, 
                                 :from_state, :from_zip, :to_name, :to_street1, :to_street2, 
                                 :to_city, :to_state, :to_zip, :width, :length, :height, :weight)
  end
end
