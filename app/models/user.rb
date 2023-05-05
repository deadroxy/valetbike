class User < ApplicationRecord
    has_secure_password
    has_many :rentals
    has_many :bikes, through: :rentals 

    validates_presence_of :username
    validates_length_of :username, minimum: 6

    validates_presence_of :password
    validates_length_of :password, minimum: 8

    validates_presence_of :email
    validates_uniqueness_of :email

    validates_presence_of :phone_number
    validates_length_of :phone_number, is: 10 

    validates_presence_of :credit
    validates_numericality_of :credit, greater_than_or_equal_to: 0
    validates_presence_of :date_birth
    validate :block_list

    validate :user_age 

    #creds to this stack overflow post https://stackoverflow.com/questions/40457247/id-like-to-validate-a-birthdate-attribute-to-be-over-18-years-old 

    def user_age 
       if date_birth.present? && date_birth > 16.years.ago 
            errors.add( :date_birth, 'you must be at least 16 years old to use valleyScoot')
     end 
    end

    def block_list
        if username == ("Hannah" || "Harrison" || "Jesus")
        errors.add( :username, 'We have blocked this username. Please to not use our app. If you think this is a mistake, contact the development team. ')
     end
    end

    def welcome
        "Hello, #{self.email}!"
    end
end
