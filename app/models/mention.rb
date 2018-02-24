class Mention < ApplicationRecord
  belongs_to :mentioner, polymorphic: true
  belongs_to :mentioned, polymorphic: true
  belongs_to :mentioned_in, polymorphic: true
end
