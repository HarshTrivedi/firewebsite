class AddStatcounterSnippetToYear < ActiveRecord::Migration
  def change
    add_column :years, :statscounter_snippet, :text 
  end
end
