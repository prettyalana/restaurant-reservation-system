require 'rails_helper'

RSpec.describe Table, type: :model do
  it { should have_many(:reservations).dependent(:destroy)}
  it { should validate_numericality_of(:seats)}

end
