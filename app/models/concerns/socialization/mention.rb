module Socialization::Mention
  extend ActiveSupport::Concern

  def mention!(mentioner, mentioned)
    if mentioned.try(:mentionable?)
      mentioned.create_mention!(mentioner, self)
    else
      false
    end
  end

  def delete_mention!(mentioner, mentioned)
    mentioned.delete_mention!(mentioner, self)
  end

  def update_mention!(mentioner, mentioned, new_mentioned)
    # update the mentioned person
    mentioned.update_mention!(mentioner, self, new_mentioned)
  end
end
