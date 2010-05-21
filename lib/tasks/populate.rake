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
      "1", "2", "3"
      ].collect {|sampling| { :name => sampling } })
  end
  
  desc "Destroy all records from colgate_word and repopulate it"
  task :care_day => :environment do
    CareDay.destroy_all
    CareDay.create([
      "Floss; strips, tapes, picks", "Mouthwash  / rinse / antiseptics", "Toothpaste / tooth brush", "Breath mints, gums, strips", "Whitening kits / rinses / toothpastes", "Water jet cleaners (irrigators) like a Waterpik"
      ].collect {|care_day| { :name => care_day } })
  end
  
  
  desc "Destroy and populate all tables needed for all surveys"
  task :all => :environment do
    ["age_group","state","income_group","colgate_word","toothpaste_word","oral_care_word","care_need","sampling","care_day","occasion_word"].each do |task|
      Rake::Task["populate:#{task}"].execute
    end
  end
  
end