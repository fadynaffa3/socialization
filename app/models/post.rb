class Post < ApplicationRecord
  belongs_to :user

  acts_as_taggable

  after_tag_created :notify_on_tag
  after_tag_deleted :notify_on_tag
  after_tag_updated :notify_on_tag

  def notify_on_tag(tag)
    # HOLA
  end
end
