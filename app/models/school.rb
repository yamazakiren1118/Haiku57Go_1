class School < ApplicationRecord
    validates :haiku1,presence:true,length:{in: 4..7}
    validates :haiku2,presence:true,length:{in: 5..9}
    validates :haiku3,presence:true,length:{in: 4..7}

    validates :name,presence:true
    validates :email,presence:true
    validates :address,presence:true
    
    validates :permit,inclusion:{in:[true,false]}
    # validates :user_id,presence:true
end
