require "administrate/field/base"

class StringTagField < Administrate::Field::Base
  def to_s
    data
  end

  def joined
    data.join(',')
  end
end
