repository=influxdb

.PHONY: deploy remove logs

deploy:
	mkdir -p /var/docker/${repository}/data
	mkdir -p /var/docker/${repository}/conf
	cp influxdb.conf /var/docker/${repository}/conf/influxdb.conf
	docker stack deploy -c stack.yml ${repository}

remove:
	docker stack rm ${repository}

logs:
	docker logs $$(docker ps --filter name=$(repository) -q)
