class ChangeSocialImpact < ActiveRecord::Migration[6.0]
  def change
    rename_column :social_impacts, :problem, :social_cause
    rename_column :social_impacts, :empathy, :social_commitment
    rename_column :social_impacts, :responsibility, :integrity
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
