class Code < ApplicationRecord

  def generate_code
    array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    secret_code = []
    5.times do 
      secret_code << array.sample
    end
    return secret_code.join("")
  end

  def self.check_code(input)
    active_code = Code.find_by(secret_code: input)
    if active_code
      if active_code.active == true
        true
      else
        false
      end
    else
      false
    end
  end

  def activate
    self.update_attributes(:active => true)
  end

end
