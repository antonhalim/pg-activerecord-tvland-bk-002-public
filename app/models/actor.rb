class Actor < ActiveRecord::Base
  has_many :shows
  has_many :characters

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def list_roles
    roles = ""
    characters.map do |character|
      show = Show.find(character.show_id)
      roles.concat("#{character.name} - #{show.name}\n")
    end
    roles
  end
end
