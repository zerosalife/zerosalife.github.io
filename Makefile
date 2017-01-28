all: blog

preview:
	bundle exec rake generate && bundle exec rake preview

blog:
	sudo ssh-add ~/.ssh/id_rsa && \
	git pull && \
	bundle install && \
	bundle exec rake integrate && \
	bundle exec rake generate && \
	bundle exec rake deploy && \
	git add .; \
	git commit -am "blog update $$(date +%Y-%m-%d)"; \
	git push origin source

.PHONY: blog			# Force blog to run regardless of the changes to the files.
