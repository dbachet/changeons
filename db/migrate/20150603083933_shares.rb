class Link < ActiveRecord::Base; end

def links_attr_array
  Link.all.map do |link|
    {
      name: link.name,
      url: link.url,
      user_id: link.user_id,
      language: link.language,
      category_id: link.category_id,
      created_at: link.created_at,
      updated_at: link.updated_at,
      type: ""
    }
  end
end

class Shares < ActiveRecord::Migration

  def change

    create_table :shares do |t|
      t.string :type
      t.text     "name"
      t.text     "url"
      t.integer  "user_id"
      t.string   "language"
      t.integer  "category_id"
      t.integer  "remote_id", limit: 8
      t.timestamps null: false
      t.index :created_at
    end

    migrate_legacy_links

  end

  def migrate_legacy_links
    Share.create(links_attr_array)
    Share.all.each { |share| share.update(type: "Link") }
  end

end