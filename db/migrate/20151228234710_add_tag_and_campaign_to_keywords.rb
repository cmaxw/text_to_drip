class AddTagAndCampaignToKeywords < ActiveRecord::Migration
  def change
    add_column :keywords, :tag, :string
    add_column :keywords, :campaign, :string
  end
end
