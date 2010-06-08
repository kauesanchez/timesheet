class Floss < ActiveRecord::Base
  has_and_belongs_to_many :colgate_surveys
  
   def to_img
      case name
       when 'Floss; strips, tapes, picks' then "floss"
       when 'Mouthwash  / rinse / antiseptics' then "mouthwash"
       when 'Toothpaste / tooth brush' then "brush"
       when 'Breath mints, gums, strips' then "breathmints"
       when 'Whitening kits / rinses / toothpastes' then "kit"
       when 'Water jet cleaners (irrigators)' then "waterpik"

       else""
       end + ".png"
   end

  def to_s
    name
  end
end
