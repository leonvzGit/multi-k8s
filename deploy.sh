 docker build -t leonvzd/multi-client:latest -t leonvzd/multi-client:$SHA ./client
 docker build -t leonvzd/multi-server:latest -t leonvzd/multi-server:$SHA  ./server
 docker build -t leonvzd/multi-worker:latest -t leonvzd/multi-worker:$SHA  ./worker
 docker push leonvzd/multi-client:latest
 docker push leonvzd/multi-server:latest
 docker push leonvzd/multi-worker:latest
 docker push leonvzd/multi-client:$SHA
 docker push leonvzd/multi-server:$SHA
 docker push leonvzd/multi-worker:$SHA
 kubectl apply -f k8s
 kubectl set image deployments/server-deployment server=leonvzd/multi-server:$SHA
 kubectl set image deployments/client-deployment client=leonvzd/multi-client:$SHA
 kubectl set image deployments/worker-deployment worker=leonvzd/multi-worker:$SHA
