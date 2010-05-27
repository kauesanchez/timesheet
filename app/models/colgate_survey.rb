class ColgateSurvey < Survey
    QUESTION = []
    QUESTION[1] = {:title=>"What's your age?",:fields=>[:age_group_id]} 
    QUESTION[2] = {:title=>"Pick your gender:",:fields=>[:gender]}
    QUESTION[3] = {:title=>"Where are you right now? ",:fields=>[:state_id]}
    QUESTION[4] = {:title=>"Please tell us your income range: ",:fields=>[:income_group_id]}
    QUESTION[5] = {:title=>"Please drag three oral care products and drop them into the boxes on the right in the order that you use the most.",:fields=>[:colgate_words]}
    QUESTION[6] = {:title=>"Please click on what part of the day you would use each oral care product.  You can click on more than one day part per item if applicable. Please only select the oral care products you use.",:fields=>[:floss_id,:mouth_wash_id,:toothpaste_id,:breath_mint_id,:whitening_kit_id,:water_jet_id]}
    QUESTION[7] = {:title=>"What does a “healthy mouth” mean to you? ",:fields=>[:healthy_mouth]}
    QUESTION[8] = {:title=>"Please drag down 3 of the dental products above that  you use the most in order of importance / usage.",:fields=>[:toothpaste_words]}
    QUESTION[9] = {:title=>"Why did you select -- as your most important?",:fields=>[:toothpaste_word_why]}
    QUESTION[10] = {:title=>"Of the top three you have selected what would motivate you to change the order of importance? <br />Please rank your top three reasons.",:fields=>[:samplings]}
    QUESTION[11] = {:title=>"You chose -- as your number one reason, can you please share why.",:fields=>[:toothpaste_importance_other]}
    QUESTION[12] = {:title=>"Please drag and drop the 3 most important oral care needs for you.",:fields=>[:oral_care_words]}
    QUESTION[13] = {:title=>"Why did you select -- as your most important?",:fields=>[:oral_importance_why]}
    QUESTION[14] = {:title=>"Of the three important oral care needs you have selected above please click on the one brand below, of the three you chose, that would best satisfy all your 3 of your most important oral care needs",:fields=>[:colgate_important_id]}
    QUESTION[15] = {:title=>"Of the three most important oral care needs that you have selected, please drag three of the most important occasions / situations (in order of importance) that you need your top oral care needs to be taken care of:",:fields=>[:occasion_words]}
    QUESTION[16] = {:title=>"If you could only choose one item to take care of your oral care needs, which one would you choose to get your through the day. Please click on one item.",:fields=>[:care_day_id]}
    QUESTION[17] = {:title=>"Please select how frequently you purchase only the items you use for your oral care needs. ",:fields=>[:floss_care_id,:a_mouth_wash_id,:a_toothpaste_id,:a_breath_mint_id,:a_whitening_kit_id,:a_water_jet_id]}
    QUESTION[18] = {:title=>"Please click on the  statement you find the most appealing and cllick on the  statement you find the least appealing:",:fields=>[:most_appealing_id,:last_appealing_id]}
    QUESTION[19] = {:title=>"Please click on the  statement you find the most appealing and cllick on the  statement you find the least appealing:",:fields=>[:statement_most_appealing_id,:statement_last_appealing_id]}
    QUESTION[20] = {:title=>"Where do you go the most to purchase your oral care products? Please click on only one.",:fields=>[:purchase_id]}
    QUESTION[21] = {:title=>"Can you please let us know the name of the store you frequent the most for your oral care purchases?",:fields=>[:store]}
    
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
      LABELS[:floss_care]="Floss; strips, tapes, picks"
      LABELS[:a_mouth_wash]="Mouthwash  / rinse / antiseptics"
      LABELS[:a_toothpaste]="Toothpaste / tooth brush"
      LABELS[:a_breath_mint]="Breath mints, gums, strips"
      LABELS[:a_whitening_kit]="Whitening kits / rinses / toothpastes"
      LABELS[:a_water_jet]="Water jet cleaners (irrigators)like a Waterpik"
   
    
      type_validations
    
    MALE = true
    FEMALE = false
    NUMBER_OF_COLGATE_WORDS = 3
    NUMBER_OF_TOOTHPASTE_WORDS = 3
    NUMBER_OF_ORAL_CARE_WORDS = 3
    NUMBER_OF_OCCASION_WORDS = 3
    NUMBER_OF_SAMPLINGS = 3 

    belongs_to :age_group
    has_and_belongs_to_many :flosses
    has_and_belongs_to_many :mouth_washes
    has_and_belongs_to_many :toothpastes
    has_and_belongs_to_many :breath_mints
    has_and_belongs_to_many :whitening_kits
    has_and_belongs_to_many :water_jets
    belongs_to :floss_care
    belongs_to :a_mouth_wash
    belongs_to :a_toothpaste
    belongs_to :a_breath_mint
    belongs_to :a_whitening_kit
    belongs_to :a_water_jet
    belongs_to :income_group
    belongs_to :state
    belongs_to :sampling
    belongs_to :care_day
    belongs_to :most_appealing
    belongs_to :last_appealing
    belongs_to :statement_most_appealing
    belongs_to :statement_last_appealing
    belongs_to :purchase
    belongs_to :colgate_word
    belongs_to :toothpaste_word
    belongs_to :oral_care_word
    belongs_to :colgate_important
    has_and_belongs_to_many :colgate_words
    has_and_belongs_to_many :occasion_words
    has_and_belongs_to_many :toothpaste_words
    has_and_belongs_to_many :oral_care_words
    has_and_belongs_to_many :samplings
   
    #validates_presence_of :floss_id
    #validates_presence_of :mouth_wash_id
    #validates_presence_of :toothpaste_id
    #validates_presence_of :breath_mint_id
    #validates_presence_of :whitening_kit_id
    #validates_presence_of :water_jet_id
    
    # validates_presence_of :floss_care_id
    #validates_presence_of :a_mouth_wash_id
    #validates_presence_of :a_toothpaste_id
    #validates_presence_of :a_breath_mint_id
    #validates_presence_of :a_whitening_kit_id
    #validates_presence_of :a_water_jet_id
    
  
    validates_presence_of :colgate_important_id
   
    validates_presence_of :age_group_id
    validates_presence_of :income_group_id
    validates_presence_of :gender
    validates_presence_of :state_id
    validates_presence_of :care_day_id
    validates_presence_of :most_appealing_id
    validates_presence_of :last_appealing_id
    validates_presence_of :statement_most_appealing_id
    validates_presence_of :statement_last_appealing_id
    validates_presence_of :purchase_id
    validates_presence_of :healthy_mouth, :message=>": must write something"
    validates_presence_of :toothpaste_word_why, :message=>": must write something"
    validates_presence_of :toothpaste_importance_other, :message=>": must write something"
    validates_presence_of :oral_importance_why, :message=>": must write something"
    validates_presence_of :store, :message=>": must write something"
    
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
