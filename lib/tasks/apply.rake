namespace :db do
  desc 'apply Schemafile and update schema.rb'
  task apply: :environment do
    ENV['ALLOW_DROP_TABLE'] ||= '0'
    ENV['ALLOW_REMOVE_COLUMN'] ||= '0'
    ENV['RAILS_ENV'] ||= 'development'
    task_return = `ridgepole -E #{ENV['RAILS_ENV']} --dump-with-default-fk-name --diff config/database.yml db/ridgepole/Schemafile`
    column_condition = task_return.include?('remove_column') && ENV['ALLOW_REMOVE_COLUMN'] == '0'
    table_condition = task_return.include?('drop_table') && ENV['ALLOW_DROP_TABLE'] == '0'
    if column_condition || table_condition
      puts '[Warning]this task contains some risks: "remove_column" or "drop_table", if you want remove_column or drop_table, add `ALLOW_REMOVE_COLUMN=true` or `ALLOW_DROP_TABLE=true`'
    else
      sh "ridgepole -E #{ENV['RAILS_ENV']} -c config/database.yml --dump-with-default-fk-name --apply -f db/ridgepole/Schemafile"
      sh 'rake db:schema:dump'
    end
  end
end
