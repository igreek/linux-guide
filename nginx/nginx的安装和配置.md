- nginx的安装


[参考地址](https://segmentfault.com/a/1190000007116797)


- nginx的配置
```

#user  root;
worker_processes  1;

#error_log  logs/error.log;
#error_log  logs/error.log  notice;
#error_log  logs/error.log  info;

#pid        logs/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       mime.types;
    default_type  application/octet-stream;

    #log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
    #                  '$status $body_bytes_sent "$http_referer" '
    #                  '"$http_user_agent" "$http_x_forwarded_for"';

    #access_log  logs/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    #keepalive_timeout  0;
    keepalive_timeout  65;

    #gzip  on;

        upstream XXX {
                 server 127.0.0.1:8088;
        }


        server {

	        listen   8087;
	        server_name credit-report-server.com;
         	access_log /logs/access.log;
        	error_log /logs/error.log;

        	location / {
        		root /xxxx;
          	      	index index.html;
                        if ($query_string) {
         			expires max;
        		}
        	}

        	location ^~ /report/gateway {
        		proxy_pass_header Server;
        		proxy_set_header Host $http_host;
        		proxy_redirect off;
         		proxy_set_header X-Real-IP $remote_addr;
         		proxy_set_header X-Scheme $scheme;
        		proxy_pass http://XXX;
        	}
         }

    # another virtual host using mix of IP-, name-, and port-based configuration
    #
    #server {
    #    listen       8000;
    #    listen       somename:8080;
    #    server_name  somename  alias  another.alias;

    #    location / {
    #        root   html;
    #        index  index.html index.htm;
    #    }
    #}


    # HTTPS server
    #
    #server {
    
    #    listen       443 ssl;
    #    server_name  localhost;

    #    ssl_certificate      cert.pem;
    #    ssl_certificate_key  cert.key;

    #    ssl_session_cache    shared:SSL:1m;
    #    ssl_session_timeout  5m;

    #    ssl_ciphers  HIGH:!aNULL:!MD5;
    #    ssl_prefer_server_ciphers  on;

    #    location / {
    #        root   html;
    #        index  index.html index.htm;
    #    }
    #}

}


```