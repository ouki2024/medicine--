class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      
      t.references :user, foreign_key: true
      
      t.string :nickname
      t.string :gender
      t.string :hospital
      t.string :clinical_department
      t.string :pharmacy
      t.string :use_count
      t.string :address
      
      t.integer :age
      t.integer :visit_month
      t.integer :cost
      
      t.text :content
      
      t.float :waiting_time
      t.float :atmosphere
      t.float :total_evalution
      
      t.timestamps
    end
    
   
  end
end
