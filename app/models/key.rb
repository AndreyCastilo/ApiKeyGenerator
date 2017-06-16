class Key < ApplicationRecord
    validates :correo, presence: true, email_format: { message: "Doesn't look like an email address" } ,uniqueness: true
end
