class Tag < ApplicationRecord
  belongs_to :tagger, polymorphic: true
  belongs_to :tagged, polymorphic: true
end
