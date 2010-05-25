class ColgateSurvey < Survey
    QUESTION = []
    QUESTION[1] = {:title=>"What's your age?",:fields=>[:age_group_id]} 
    QUESTION[2] = {:title=>"Pick your gender:",:fields=>[:gender]}
    QUESTION[3] = {:title=>"Where are you right now? ",:fields=>[:state_id]}
    QUESTION[4] = {:title=>"Please tell us your income range: ",:fields=>[:income_group_id]}
    QUESTION[5] = {:title=>"Please drag down 3 of the oral care products above that  you use the most.",:fields=>[:colgate_words]}
    QUESTION[6] = {:title=>"Please click on what part of the day you would use each oral care product.  You can click on more than one day part per item if applicable. Please only select the oral care products you use.",:fields=>[:floss_id,:mouth_wash_id,:toothpaste_id,:breath_mint_id,:whitening_kit_id,:water_jet_id]}
    QUESTION[7] = {:title=>"What does a “healthy mouth” mean to you? ",:fields=>[:healthy_mouth]}
    QUESTION[8] = {:title=>"Please drag down 3 of the toothpaste products above that  you use the most in order of importance / usage.",:fields=>[:toothpaste_words]}
    QUESTION[9] = {:title=>"Why did you select -- as your most important?",:fields=>[:toothpaste_word_why]}
    QUESTION[10] = {:title=>"Of the top three you have selected what would motivate you to change the order of importance? Please rank your top three reasons",:fields=>[:samplings]}
    QUESTION[11] = {:title=>"You chose “other” as your number  " " reason, can you please share what the reason would be? ",:fields=>[:toothpaste_importance_other]}
    QUESTION[12] = {:title=>"Please drag and drop the 3 most important oral care needs for you.",:fields=>[:oral_care_words]}
    QUESTION[13] = {:title=>"Why did you select -- as your most important?",:fields=>[:oral_importance_why]}
    QUESTION[14] = {:title=>"Of the three important oral care needs you have selected above please click on the one brand below, of the three you chose, that would best satisfy all your 3 of your most important oral care needs",:fields=>[:colgate_word_id]}
    QUESTION[15] = {:title=>" Of the three most important oral care needs that you have selected (they would be displayed above), please drag three of the most important occasions / situations (in order of importance)  that you need your top oral care needs to be taken care of:",:fields=>[:occasion_words]}
    QUESTION[16] = {:title=>" If you could only choose one item to take care of your oral care needs, which one would you choose to get your through the day. Please click on one item.",:fields=>[:care_day]}
    
    ATTRIBUTE_QUESTION = {}
    QUESTION.each_with_index {|elements,i| elements[:fields].each{ |element| ATTRIBUTE_QUESTION[element] = i } unless elements.blank? }
    NUMBER_OF_QUESTIONS=QUESTION.size-1
    PUBLISHED = false
    EXTRA_GRAPHS = []
    
    
    LABELS={}
     LABELS[:floss]="Floss; strips, tapes, picks"
     LABELS[:mouth_wash]="Mouthwash  / rinse / antiseptics"
     LABELS[:toothpaste]="Toothpaste / tooth brush"
     LABELS[:breath_mint]="Breath mints, gums, strips"
     LABELS[:whitening_kit]="Whitening kits / rinses / toothpastes"
     LABELS[:water_jet]="Water jet cleaners (irrigators)like a Waterpik"
  
    LABELS2={}
    LABELS2[:sampling]="Sampling"
    
      type_validations
    
    MALE = true
    FEMALE = false
    NUMBER_OF_COLGATE_WORDS = 3
    NUMBER_OF_TOOTHPASTE_WORDS = 3
    NUMBER_OF_ORAL_CARE_WORDS = 3
    NUMBER_OF_OCCASION_WORDS = 3
    NUMBER_OF_SAMPLINGS = 7
    
    
    (0...NUMBER_OF_TOOTHPASTE_WORDS).each {|i| attr_accessor :"colgate_rate_#{i}" }

    def after_save
      if colgate_rates.blank?
        raise "blank colgate word rates"
      else
        colgate_rates.each do |colgate_rate|
          index = toothpaste_words.index colgate_rate.toothpaste_word
          rate = self["lincoln_rate_#{index}"]
          colgate_rate.update_attribute(:rate, rate)
        end
      end
    end
    
    belongs_to :age_group
    belongs_to :floss
    belongs_to :mouth_wash
    belongs_to :toothpaste
    belongs_to :breath_mint
    belongs_to :whitening_kit
    belongs_to :water_jet
    belongs_to :income_group
    belongs_to :state
    belongs_to :sampling
    belongs_to :care_day
    belongs_to :colgate_word
    belongs_to :sampling
    belongs_to :toothpaste_word
    belongs_to :oral_care_word
    has_many :colgate_rates
    has_and_belongs_to_many :colgate_words
    has_and_belongs_to_many :occasion_words
    has_and_belongs_to_many :toothpaste_words
    has_and_belongs_to_many :oral_care_words
    has_and_belongs_to_many :samplings
   
    validates_presence_of :floss_id
    
    
    
    validates_presence_of :age_group_id
    validates_presence_of :income_group_id
    validates_presence_of :gender
    validates_presence_of :state_id
    validates_presence_of :healthy_mouth, :message=>": must write something"
    validates_presence_of :toothpaste_word_why, :message=>": must write something"
    validates_presence_of :toothpaste_importance_other, :message=>": must write something"
    validates_presence_of :oral_importance_why, :message=>": must write something"
    
    validate :drop_3_colgate_words
    validate :drop_3_toothpaste_words
    validate :drop_3_oral_care_words
    validate :drop_3_occasion_words
    validate :drop_3_samplings
    

    def colgate_word_id
      colgate_word.id if colgate_word
    end
    
    def drop_3_colgate_words
       errors.add(:colgate_words, " must drop #{NUMBER_OF_COLGATE_WORDS} words into the empty box") if self.colgate_words.size != NUMBER_OF_COLGATE_WORDS && self.question_number > ATTRIBUTE_QUESTION[:colgate_words]
    end

    def drop_3_occasion_words
       errors.add(:occasion_words, " must drop #{NUMBER_OF_OCCASION_WORDS} words into the empty box") if self.occasion_words.size != NUMBER_OF_OCCASION_WORDS && self.question_number > ATTRIBUTE_QUESTION[:occasion_words]
    end
    
    def drop_3_toothpaste_words
       errors.add(:toothpaste_words, " must drop #{NUMBER_OF_TOOTHPASTE_WORDS} words into the empty box") if self.toothpaste_words.size != NUMBER_OF_TOOTHPASTE_WORDS && self.question_number > ATTRIBUTE_QUESTION[:toothpaste_words]
    end
    
    def drop_3_oral_care_words
       errors.add(:oral_care_words, " must drop #{NUMBER_OF_ORAL_CARE_WORDS} words into the empty box") if self.oral_care_words.size != NUMBER_OF_ORAL_CARE_WORDS && self.question_number > ATTRIBUTE_QUESTION[:oral_care_words]
    end
    def drop_3_samplings
       errors.add(:sampling, " must drop #{NUMBER_OF_SAMPLINGS} words into the empty box") if self.samplings.size != NUMBER_OF_SAMPLINGS && self.question_number > ATTRIBUTE_QUESTION[:samplings]
    end
    
    def gender_to_img(gender)
      if gender == MALE
        "man_"+age_group.to_img
      else
        "woman_"+age_group.to_img
      end
    end
    

    def models_options_for_select
      self.models.find(:all, :order=>:name).collect{ |model| [model.name, model.id] }
    end
    
end
