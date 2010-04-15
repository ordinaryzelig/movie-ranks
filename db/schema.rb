# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100415033526) do

  create_table "movies", :force => true do |t|
    t.string   "title",      :null => false
    t.string   "imdb_id",    :null => false
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "movies", ["imdb_id"], :name => "index_movies_on_imdb_id", :unique => true
  add_index "movies", ["title"], :name => "index_movies_on_title"
  add_index "movies", ["year"], :name => "index_movies_on_year"

  create_table "movies_tags", :id => false, :force => true do |t|
    t.integer  "movie_id"
    t.integer  "tag_id"
    t.datetime "created_at"
  end

  create_table "ranking_averages", :force => true do |t|
    t.integer  "percentile"
    t.integer  "movie_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ranking_averages", ["movie_id", "tag_id"], :name => "index_ranking_averages_on_movie_id_and_tag_id", :unique => true
  add_index "ranking_averages", ["percentile"], :name => "index_ranking_averages_on_percentile"

  create_table "rankings", :force => true do |t|
    t.integer  "movie_id",   :null => false
    t.integer  "user_id",    :null => false
    t.integer  "tag_id"
    t.integer  "position"
    t.integer  "percentile"
    t.datetime "created_at"
  end

  create_table "tags", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                          :null => false
    t.boolean  "is_admin",   :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["name"], :name => "index_users_on_name", :unique => true

end
