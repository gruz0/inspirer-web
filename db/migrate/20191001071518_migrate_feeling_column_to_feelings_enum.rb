# frozen_string_literal: true

class MigrateFeelingColumnToFeelingsEnum < ActiveRecord::Migration[5.2]
  def up
    cases = <<-DDL.squish
      USING CASE feeling
        WHEN 'amazing' THEN 'amazing'::feelings
        WHEN 'happy' THEN 'happy'::feelings
        WHEN 'energetic' THEN 'energetic'::feelings
        WHEN 'good' THEN 'good'::feelings
        WHEN 'depressed' THEN 'depressed'::feelings
        WHEN 'afraid' THEN 'afraid'::feelings
        WHEN 'sad' THEN 'sad'::feelings
        WHEN 'angry' THEN 'angry'::feelings
      END
    DDL

    execute <<-DDL.squish
      ALTER TABLE health_sleeps
      ALTER COLUMN feeling TYPE feelings
      #{cases}
    DDL

    execute <<-DDL.squish
      ALTER TABLE health_body_weights
      ALTER COLUMN feeling TYPE feelings
      #{cases}
    DDL

    execute <<-DDL.squish
      ALTER TABLE health_body_measures
      ALTER COLUMN feeling TYPE feelings
      #{cases}
    DDL
  end

  def down
    alter_column = <<-DDL.squish
      ALTER COLUMN feeling TYPE text
      USING feeling::text;
    DDL

    execute <<-DDL.squish
      ALTER TABLE health_sleeps
      #{alter_column}
    DDL

    execute <<-DDL.squish
      ALTER TABLE health_body_weights
      #{alter_column}
    DDL

    execute <<-DDL.squish
      ALTER TABLE health_body_measures
      #{alter_column}
    DDL
  end
end
