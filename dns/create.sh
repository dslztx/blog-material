docker network create \
	  --subnet=172.20.0.0/16 \
	    --opt com.docker.network.bridge.name=br-bind9 \
	      --opt com.docker.network.bridge.enable_ip_masquerade=true \
	        bind9-static-net

# 实例 1：固定IP 172.20.0.55
docker run -d --name bind9-55 \
	  --network bind9-static-net --ip 172.20.0.55 \
	    -p 55:53/udp -p 55:53/tcp \
	        -v ~/bind9/55/named.conf.local:/etc/bind/named.conf.local \
	          -v ~/bind9/55/named.conf.options:/etc/bind/named.conf.options \
		    -v ~/bind9/55/zones:/etc/bind/zones \
		    ubuntu/bind9:9.18-22.04_beta

# 实例 2：固定IP 172.20.0.57
docker run -d --name bind9-57 \
	  --network bind9-static-net --ip 172.20.0.57 \
	    -p 57:53/udp -p 57:53/tcp \
	        -v ~/bind9/57/named.conf.local:/etc/bind/named.conf.local \
	          -v ~/bind9/57/named.conf.options:/etc/bind/named.conf.options \
		    -v ~/bind9/57/zones:/etc/bind/zones \
		      ubuntu/bind9:9.18-22.04_beta

# 实例 3：固定IP 172.20.0.59
docker run -d --name bind9-59 \
	  --network bind9-static-net --ip 172.20.0.59 \
	    -p 59:53/udp -p 59:53/tcp \
	        -v ~/bind9/59/named.conf.local:/etc/bind/named.conf.local \
	          -v ~/bind9/59/named.conf.options:/etc/bind/named.conf.options \
		    -v ~/bind9/59/zones:/etc/bind/zones \
		      ubuntu/bind9:9.18-22.04_beta


