# README

Please follow the steps below to run project

Steps:

* Clone project

* run 'cd <path to project>'

* run 'bundle install'

* Change mysql configuration i.e. username password in config/database.yml

* run 'rake db:create db:migrate'

* run 'rails s'

* Initially there will be no records in database.

* Streaming tweets from twitter will start after 1 minute as set in 'config/initializers/twitter.rb'. Change the line 'SearchTweetsJob.set(wait: 1.minute).perform_later' to 'SearchTweetsJob.perform_later' if you want to run job instantly

* Since its a developement app there is no extar gem for cron job or backgroung job, its simply performed by Active Jobs.

* On Browser run 'hhtp://localhost:3000'

* If records are already present in DB they will appear else ther will appear in one minute after streaming and append to page.
