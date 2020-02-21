class Mimus < ApplicationRecord
  validates :unique_hash, uniqueness: true

  before_save :write_unique_hash

  def to_param
    hash_content
  end

  def hash_content
    XXhash.xxh32(self.content).to_s
  end

  def unique_hash
    # this allows us to still redirect to the mimus with the same content if a save fails due to
    # uniqueness constraint. the create method redirects to @mimus after a save whether or not
    # it is successful. This lets us reference the `unique_hash` attribute on that unsaved in
    # memory instance of a mimus. Rails is using the `to_param` under the hood to redirect to mimus
    read_attribute(:unique_hash) || hash_content
  end

  private

  def write_unique_hash
    self.unique_hash = self.hash_content
  end
end
