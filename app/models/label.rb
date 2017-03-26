class LabelValidator < ActiveModel::Validator
  def validate(record)
    states = ["AK", "ALASKA", 
                  "AL", "ALABAMA", 
                  "AR", "ARKANSAS", 
                  "AS", "AMERICAN SAMOA", 
                  "AZ", "ARIZONA", 
                  "CA", "CALIFORNIA", 
                  "CO", "COLORADO", 
                  "CT", "CONNECTICUT", 
                  "DC", "DISTRICT OF COLUMBIA", 
                  "DE", "DELAWARE", 
                  "FL", "FLORIDA", 
                  "GA", "GEORGIA", 
                  "GU", "GUAM", 
                  "HI", "HAWAII", 
                  "IA", "IOWA", 
                  "ID", "IDAHO", 
                  "IL", "ILLINOIS", 
                  "IN", "INDIANA", 
                  "KS", "KANSAS", 
                  "KY", "KENTUCKY", 
                  "LA", "LOUISIANA", 
                  "MA", "MASSACHUSETTS", 
                  "MD", "MARYLAND", 
                  "ME", "MAINE", 
                  "MI", "MICHIGAN", 
                  "MN", "MINNESOTA", 
                  "MO", "MISSOURI", 
                  "MS", "MISSISSIPPI", 
                  "MT", "MONTANA", 
                  "NC", "NORTH CAROLINA", 
                  "ND", "NORTH DAKOTA", 
                  "NE", "NEBRASKA", 
                  "NH", "NEW HAMPSHIRE", 
                  "NJ", "NEW JERSEY", 
                  "NM", "NEW MEXICO", 
                  "NV", "NEVADA", 
                  "NY", "NEW YORK", 
                  "OH", "OHIO", 
                  "OK", "OKLAHOMA", 
                  "OR", "OREGON", 
                  "PA", "PENNSYLVANIA", 
                  "PR", "PUERTO RICO", 
                  "RI", "RHODE ISLAND", 
                  "SC", "SOUTH CAROLINA", 
                  "SD", "SOUTH DAKOTA", 
                  "TN", "TENNESSEE", 
                  "TX", "TEXAS", 
                  "UT", "UTAH", 
                  "VA", "VIRGINIA", 
                  "VI", "VIRGIN ISLANDS", 
                  "VT", "VERMONT", 
                  "WA", "WASHINGTON", 
                  "WI", "WISCONSIN", 
                  "WV", "WEST VIRGINIA", 
                  "WY", "WYOMING"]
    from_state, to_state = record.from_state.upcase, record.to_state.upcase
    unless from_state.in?(states) and to_state.in?(states)
      record.errors[:state] << "Please enter a valid state!"
    end
    width, height, length, weight = record.width, record.height, record.length, record.weight
    unless width > 0 and height > 0 and weight > 0 and weight > 0
      record.errors[:width] << "Please enter valid measurements!"
    end
  end
end


class Label < ApplicationRecord
  include ActiveModel::Validations
  validates_with LabelValidator
end
