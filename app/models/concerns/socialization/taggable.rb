module Socialization::Taggable
  extend ActiveSupport::Concern

  module ClassMethods
    def after_tag_created(method)
      @after_create_hook = method
    end

    def after_tag_updated(method)
      @after_update_hook = method
    end

    def after_tag_deleted(method)
      @after_delete_hook = method
    end
  end

  included do
    has_many :tags, as: :tagged

    def taggable?
      true
    end

    def create_tag!(tagger)
      return false unless tags.where(tagger: tagger).count.zero?
      tag = Tag.create(tagger: tagger, tagged: self)
      call_after_action_hooks(tag, :create)
    end

    def delete_tag!(tagger)
      tags.where(tagger: tagger).destroy_all
      call_after_action_hooks(tag, :delete)
    end

    def update_tag!(tagger, new_tagged)
      tag = tags.where(tagger: tagger).first
      return false unless tag.present?
      tag.update_attributes(tagged: new_tagged)
      call_after_action_hooks(tag, :update)
    end
  end
end
