class SpreadheadCreatePages < ActiveRecord::Migration
  def self.up
    create_table(:pages) do |t|
      t.string   :url, :null => false
      t.string   :text, :null => false
      t.string   :title, :null => false
      t.string   :keywords
      t.string   :description
      t.string   :formatting
      t.string   :category
      t.boolean  :published, :default => false, :null => false
      t.timestamps
    end
    add_index :pages, [:url, :id, :published]
  end

  def self.down
    drop_table :pages
  end
end
