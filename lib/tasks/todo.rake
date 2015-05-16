namespace :todo do
  desc "Deletes todo items after 7 days"
  task delete_items: :environment do
    Item.where("created_at <= ?", Time.now - 7.days).each do |item|
      item.destroy
    end
  end
end
