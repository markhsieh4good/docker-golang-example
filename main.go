package main

import (
	"fmt"
	//"github.com/go-redis/redis"
	"github.com/go-redis/redis/v8"
)

func main() {
	fmt.Println("Go Redis Tutorial")

	client := redis.NewClient(&redis.Options{
		Addr: "localhost:6379",
		Password: "",
		DB: 0,
	})

        // use go-redis/redis
        // pong, err := client.Ping().Result()
        // use go-redis/redis/v8
	pong, err := client.Ping(client.Context()).Result()
	fmt.Println(pong, err)

}
//docker build -t my-go-redis .
//docker run --rm --name my-run-go-redis my-go-redis
