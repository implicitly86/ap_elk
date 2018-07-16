 FROM sebp/elk

 # Remove old logstash config
 RUN rm /etc/logstash/conf.d/*

 WORKDIR /etc/logstash/conf.d

 # Copy needed logstash config
 ADD ./01-logstash-default.conf /etc/logstash/conf.d

 # Restart logstash with needed config
 RUN  service logstash stop
 RUN  service logstash stop
 RUN  service logstash restart -f 01-logstash-default.conf

 # Expose needed ports
 EXPOSE 5601 9200 5044

 CMD [ "/usr/local/bin/start.sh" ]
