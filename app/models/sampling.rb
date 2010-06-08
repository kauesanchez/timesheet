class Sampling < ActiveRecord::Base
   has_and_belongs_to_many :colgate_surveys
    def to_img
       case name
        when 'Sampling' then "sampling"
        when 'Packaging' then "packaging"
        when 'Coupon / discount / promotion' then "coupon"
        when 'New usage / Claim /New application' then "price"
        when 'New oral care solution / flavor / texture' then "flavor"
        when 'Professional / clinical endorsement' then "professional"
        when 'Price' then "price2"
        when 'Other' then "others"

        else""
        end + ".png"
    end
  
  def to_label
    name
  end
end
