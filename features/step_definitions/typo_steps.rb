Then /^I should see either "(.*?)" or "(.*?)"$/ do |str1, str2|
  result = [str1, str2].reject { |s| page.body.index(s).nil? }

  result.should_not be_empty
end

Given /^the following articles exist:$/ do |articles_table|
    articles_table.hashes.each do |article|
            Article.create!(article)
            # puts Article.last.title
    end
end
