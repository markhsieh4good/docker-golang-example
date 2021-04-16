# 使用說明

## 參考 
> dockerhub/golang & github/go-redis/redis 用來驗證window 上運行正確與否
> 

## 運行
> 當然要有安裝 docker service
> 
> 要在系統中有 redis server，且用 127.0.0.1:6379可以連線（要換請先改code）
> 
> 我還有安裝 GIT FOR WINDOWS 來使用 bash 功能
```
docker build -t my-go-redis-test:build1 .
docker images | grep my-go-redis
docker run --rm --name my-go-redis-test my-go-redis-test:build1

Go Redis Tutorial
 dial tcp 127.0.0.1:6379: connect: .... ?
```
