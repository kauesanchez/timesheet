require 'kbb'

namespace :populate do

  desc "Destroy all records from age_group and repopulate it"
  task :age_group => :environment do
    AgeGroup.destroy_all
    AgeGroup.create([
        17..29, 30..38, 39..46, 47..54
      ].collect{ |age_group| {:min_age=>age_group.first, :max_age=>age_group.last} })
  end

  desc "Destroy all records from state and repopulate it"
  task :state => :environment do
    State.destroy_all
    State.create([
      "Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii",
      "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota",
      "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina",
      "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas",
      "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"
      ].collect{|state| {:name=>state} } )
  end
  
  desc "Destroy all records from income_group and repopulate it"
  task :income_group => :environment do
    IncomeGroup.destroy_all
    IncomeGroup.create([
      [1,"less then $50k"],[2,"$50k to $75k"],[3,"$75k to $100k"],[4,"$100k to $125k"],[5,"$125k or more"]
      ].collect {|income| { :value => income.first, :label => income.last } })
  end
  
  desc "Destroy all records from colgate_word and repopulate it"
  task :colgate_word => :environment do
    ColgateWord.destroy_all
    ColgateWord.create([
      "Floss; strips, tapes, picks", "Mouthwash  / rinse / antiseptics", "Toothpaste / tooth brush", "Breath mints, gums, strips", "Whitening kits / rinses / toothpastes", "Water jet cleaners (irrigators) like a Waterpik"
      ].collect {|colgate_word| { :name => colgate_word } })
  end
  
  desc "Destroy all records from colgate_word and repopulate it"
  task :toothpaste_word => :environment do
    ToothpasteWord.destroy_all
    ToothpasteWord.create([
      "AIM", "Aquafresh", "Pepsodent", "Crest","Arm & Hammer", "Tom’s", "Colgate", "Mentadent"
      ].collect {|toothpaste_word| { :name => toothpaste_word } })
  end
  
  desc "Destroy all records from colgate_word and repopulate it"
  task :colgate_important => :environment do
    ColgateImportant.destroy_all
    ColgateImportant.create([
      "AIM", "Aquafresh", "Pepsodent", "Crest","Arm & Hammer", "Tom’s", "Colgate", "Mentadent"
      ].collect {|colgate_important| { :name => colgate_important } })
  end
  
  desc "Destroy all records from colgate_word and repopulate it"
  task :oral_care_word => :environment do
    OralCareWord.destroy_all
    OralCareWord.create([
      "Clean Teeth", "Fresh Breath", "Healthy Mouth", "Sensitive Teeth","Healthy Gums", "White Teeth"
      ].collect {|oral_care_word| { :name => oral_care_word } })
  end
  
  desc "Destroy all records from Occasion Word and repopulate it"
   task :occasion_word => :environment do
     OccasionWord.destroy_all
     OccasionWord.create([
       "With family", "With friends", "After dinner", "At the Dentist","After lunch", "At work: meetings, clients, customers","Meeting new people","Intimate moments","Sports","After snacks"
       ].collect {|occasion_word| { :name => occasion_word } })
   end
  
  desc "Destroy all records from colgate_word and repopulate it"
  task :care_need => :environment do
    CareNeed.destroy_all
    CareNeed.create([
      "Clean Teeth", "Fresh Breath", "Healthy Mouth", "Sensitive Teeth","Healthy Gums", "White Teeth"
      ].collect {|care_need| { :name => care_need } })
  end
  
  desc "Destroy all records from vehicle_region and repopulate it"
  task :sampling => :environment do
    Sampling.destroy_all
    Sampling.create([
      "Sampling", "Packaging", "Coupon / discount / promotion","New usage / Claim /New application", "New oral care solution / flavor / texture","Professional / clinical endorsement","Other","Price"
      ].collect {|sampling| { :name => sampling } })
  end
  
  desc "Destroy all records from vehicle_region and repopulate it"
  task :packaging => :environment do
    Packaging.destroy_all
    Packaging.create([
      "1", "2", "3"
      ].collect {|packaging| { :name => packaging } })
  end
  
  desc "Destroy all records from vehicle_region and repopulate it"
  task :coupon => :environment do
    Coupon.destroy_all
    Coupon.create([
      "1", "2", "3"
      ].collect {|coupon| { :name => coupon } })
  end
  
  desc "Destroy all records from vehicle_region and repopulate it"
  task :new_usage => :environment do
    NewUsage.destroy_all
    NewUsage.create([
      "1", "2", "3"
      ].collect {|new_usage| { :name => new_usage } })
  end
  
  desc "Destroy all records from vehicle_region and repopulate it"
   task :new_oral => :environment do
     NewOral.destroy_all
     NewOral.create([
       "1", "2", "3"
       ].collect {|new_oral| { :name => new_oral } })
   end
   desc "Destroy all records from vehicle_region and repopulate it"
    task :professional => :environment do
      Professional.destroy_all
      Professional.create([
        "1", "2", "3"
        ].collect {|professional| { :name => professional } })
    end
     desc "Destroy all records from vehicle_region and repopulate it"
      task :other => :environment do
        Other.destroy_all
        Other.create([
          "1", "2", "3"
          ].collect {|other| { :name => other } })
      end

  
  
  desc "Destroy all records from vehicle_region and repopulate it"
  task :floss => :environment do
    Floss.destroy_all
    Floss.create([
      "Morning", "Noon", "Night"
      ].collect {|floss| { :name => floss } })
  end
  
  desc "Destroy all records from vehicle_region and repopulate it"
   task :mouth_wash => :environment do
     MouthWash.destroy_all
     MouthWash.create([
       "Morning", "Noon", "Night"
       ].collect {|mouth_wash| { :name => mouth_wash } })
   end
  
  desc "Destroy all records from vehicle_region and repopulate it"
  task :toothpaste => :environment do
    Toothpaste.destroy_all
    Toothpaste.create([
      "Morning", "Noon", "Night"
      ].collect {|toothpaste| { :name => toothpaste } })
  end
  
  desc "Destroy all records from vehicle_region and repopulate it"
  task :breath_mint => :environment do
    BreathMint.destroy_all
    BreathMint.create([
      "Morning", "Noon", "Night"
      ].collect {|breath_mint| { :name => breath_mint } })
  end
  
  desc "Destroy all records from vehicle_region and repopulate it"
  task :whitening_kit => :environment do
    WhiteningKit.destroy_all
    WhiteningKit.create([
      "Morning", "Noon", "Night"
      ].collect {|whitening_kit| { :name => whitening_kit } })
  end
  
  desc "Destroy all records from vehicle_region and repopulate it"
   task :water_jet => :environment do
     WaterJet.destroy_all
     WaterJet.create([
       "Morning", "Noon", "Night"
       ].collect {|water_jet| { :name => water_jet } })
   end
   
   
   desc "Destroy all records from vehicle_region and repopulate it"
   task :floss_care => :environment do
     FlossCare.destroy_all
     FlossCare.create([
       "Few times a week", "weekly", "Once a month", "A few times a year", "Hardly ever / never"
       ].collect {|floss_care| { :name => floss_care } })
   end

   desc "Destroy all records from vehicle_region and repopulate it"
    task :a_mouth_wash => :environment do
      AMouthWash.destroy_all
      AMouthWash.create([
        "Few times a week", "weekly", "Once a month", "A few times a year", "Hardly ever / never"      
          ].collect {|a_mouth_wash| { :name => a_mouth_wash } })
    end

   desc "Destroy all records from vehicle_region and repopulate it"
   task :a_toothpaste => :environment do
     AToothpaste.destroy_all
     AToothpaste.create([
        "Few times a week", "weekly", "Once a month", "A few times a year", "Hardly ever / never"
        ].collect {|a_toothpaste| { :name => a_toothpaste } })
   end

   desc "Destroy all records from vehicle_region and repopulate it"
   task :a_breath_mint => :environment do
     ABreathMint.destroy_all
     ABreathMint.create([
      "Few times a week", "weekly", "Once a month", "A few times a year", "Hardly ever / never"
       ].collect {|a_breath_mint| { :name => a_breath_mint } })
   end

   desc "Destroy all records from vehicle_region and repopulate it"
   task :a_whitening_kit => :environment do
     AWhiteningKit.destroy_all
     AWhiteningKit.create([
      "Few times a week", "weekly", "Once a month", "A few times a year", "Hardly ever / never"
       ].collect {|a_whitening_kit| { :name => a_whitening_kit } })
   end

   desc "Destroy all records from vehicle_region and repopulate it"
    task :a_water_jet => :environment do
      AWaterJet.destroy_all
      AWaterJet.create([
        "Few times a week", "weekly", "Once a month", "A few times a year", "Hardly ever / never"
        ].collect {|a_water_jet| { :name => a_water_jet } })
    end
   
  
  desc "Destroy all records from colgate_word and repopulate it"
  task :care_day => :environment do
    CareDay.destroy_all
    CareDay.create([
      "Floss; strips, tapes, picks", "Mouthwash  / rinse / antiseptics", "Toothpaste / tooth brush", "Breath mints, gums, strips", "Whitening kits / rinses / toothpastes", "Water jet cleaners (irrigators) like a Waterpik"
      ].collect {|care_day| { :name => care_day } })
  end
  
  desc "Destroy all records from colgate_word and repopulate it"
  task :most_appealing => :environment do
    MostAppealing.destroy_all
    MostAppealing.create([
      "Shields your whole mouth with a protective germ barrier","Because 80% of germs aren’t on your teeth, they’re on your tongue, cheeks and gums.","The first toothpaste clinically proven to fight germs for 12 hours in your whole mouth","Dual action formula"
      ].collect {|most_appealing| { :name => most_appealing } })
  end
  
  desc "Destroy all records from colgate_word and repopulate it"
  task :last_appealing => :environment do
    LastAppealing.destroy_all
    LastAppealing.create([
      "Shields your whole mouth with a protective germ barrier","Because 80% of germs aren’t on your teeth, they’re on your tongue, cheeks and gums.","The first toothpaste clinically proven to fight germs for 12 hours in your whole mouth","Dual action formula"
      ].collect {|last_appealing| { :name => last_appealing } })
  end
  
  desc "Destroy all records from colgate_word and repopulate it"
  task :statement_most_appealing_id => :environment do
    StatementMostAppealing.destroy_all
    StatementMostAppealing.create([
     "Fights germs in your whole mouth for a full 12 hours","The only toothpaste clinically proven to fight  germs in your whole mouth","Now, clinically proven to fight germs everywhere in your mouth for 12 hours","Dentists recommend Colgate Total for whole mouth health"
      ].collect {|statement_most_appealing_id| { :name => statement_most_appealing_id } })
  end
  
  desc "Destroy all records from colgate_word and repopulate it"
  task :statement_last_appealing_id => :environment do
    StatementLastAppealing.destroy_all
    StatementLastAppealing.create([
      "Fights germs in your whole mouth for a full 12 hours","The only toothpaste clinically proven to fight  germs in your whole mouth","Now, clinically proven to fight germs everywhere in your mouth for 12 hours","Dentists recommend Colgate Total for whole mouth health"
      ].collect {|statement_last_appealing_id| { :name => statement_last_appealing_id } })
  end
  
  desc "Destroy all records from colgate_word and repopulate it"
  task :purchase => :environment do
    Purchase.destroy_all
    Purchase.create([
      "Supermarket / Grocery", "Drug Store", "Convenience store", "Mass Retailer", "Club Stores", "Water jet cleaners (irrigators) like a Waterpik"
      ].collect {|purchase| { :name => purchase } })
  end
  
  desc "Destroy and populate all tables needed for all surveys"
  task :all => :environment do
    ["age_group","state","income_group","colgate_word","toothpaste_word","oral_care_word","care_need","sampling","care_day","occasion_word", "floss","mouth_wash","toothpaste","breath_mint","whitening_kit","water_jet", "floss_care","a_mouth_wash","a_toothpaste","a_breath_mint","a_whitening_kit","a_water_jet","purchase","colgate_important","most_appealing","last_appealing","statement_most_appealing_id","statement_last_appealing_id"
      ].each do |task|
      Rake::Task["populate:#{task}"].execute
    end
  end
  
end