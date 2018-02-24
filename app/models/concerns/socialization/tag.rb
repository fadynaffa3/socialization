module Socialization::Tag
  extend ActiveSupport::Concern

  def tag!(tagger, tagged)
    if tagged.try(:taggable?)
      tagged.create_tag!(tagger)
    else
      false
    end
  end

  def delete_tag!(tagger, tagged)
    tagged.delete_tag!(tagger)
  end

  def update_tag!(tagger, tagged, new_tagged)
    # update the mentioned person
    tagged.update_tag!(tagger, new_tagged)
  end
end
