class UpdateEnumerationsPosition < ActiveRecord::Migration
  def self.up
    Enumeration.all.group_by(&:opt).each do |opt, enums|
      enums.each_with_index do |enum, i|
        # do not call model callbacks
        Enumeration.where({:id => enum.id}).update_all("position = #{i+1}")
      end
    end
  end
end
