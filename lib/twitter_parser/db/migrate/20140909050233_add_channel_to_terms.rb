class AddChannelToTerms < ActiveRecord::Migration
  def change
    add_column :twitter_parser_terms, :channel, :string
  end
end
