class StaticPagesController < ApplicationController
  require 'easypost'
  EasyPost.api_key = '9La5mw88klXUZJwieDFhhA'

  def home
    if not params.has_key?(:info)
      @filled_form = false
    else
      info = params[:info]
      @filled_form = true
      to_address = EasyPost::Address.create(
        :name => info[:to_name],
        :street1 => info[:to_street1],
        :street2 => info[:to_street2],
        :city => info[:to_city],
        :state => info[:to_state],
        :zip => info[:to_zip],
      )

      from_address = EasyPost::Address.create(
        :name => info[:from_name],
        :street1 => info[:from_street1],
        :street2 => info[:from_street2],
        :city => info[:from_city],
        :state => info[:from_state],
        :zip => info[:from_zip],
      )

      parcel = EasyPost::Parcel.create(
        :width => info[:width],
        :length => info[:length],
        :height => info[:height],
        :weight => info[:weight],
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
    end
  end

  def label
    d
  end
end