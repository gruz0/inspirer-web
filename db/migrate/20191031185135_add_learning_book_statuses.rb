# frozen_string_literal: true

class AddLearningBookStatuses < ActiveRecord::Migration[6.0]
  def up
    execute <<-DDL.squish
      CREATE TYPE learning_book_statuses AS ENUM (
        'new_book', 'want_to_read', 'reading_now', 'finished'
      );
    DDL
  end

  def down
    execute 'DROP type learning_book_statuses;'
  end
end
