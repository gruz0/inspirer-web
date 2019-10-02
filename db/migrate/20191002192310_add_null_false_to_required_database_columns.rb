# frozen_string_literal: true

class AddNullFalseToRequiredDatabaseColumns < ActiveRecord::Migration[5.2]
  def up
    change_column_null(:health_sleeps, :woke_up_at_hour, false)
    change_column_null(:health_sleeps, :woke_up_at_minutes, false)
    change_column_null(:health_sleeps, :feeling, false)
    change_column_null(:health_body_weights, :weight, false)
    change_column_null(:health_body_weights, :feeling, false)
    change_column_null(:health_body_measures, :chest, false)
    change_column_null(:health_body_measures, :waist, false)
    change_column_null(:health_body_measures, :hips, false)
    change_column_null(:health_body_measures, :feeling, false)
    change_column_null(:activity_walks, :feeling, false)
  end

  def down
    change_column_null(:health_sleeps, :woke_up_at_hour, true)
    change_column_null(:health_sleeps, :woke_up_at_minutes, true)
    change_column_null(:health_sleeps, :feeling, true)
    change_column_null(:health_body_weights, :weight, true)
    change_column_null(:health_body_weights, :feeling, true)
    change_column_null(:health_body_measures, :chest, true)
    change_column_null(:health_body_measures, :waist, true)
    change_column_null(:health_body_measures, :hips, true)
    change_column_null(:health_body_measures, :feeling, true)
    change_column_null(:activity_walks, :feeling, true)
  end
end
