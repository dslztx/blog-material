#!/bin/bash

# 测试 addUser（POST + JSON body，必须带 Content-Type: application/json）
curl --http1.1 -i -X POST 'http://localhost:8080/addUser' -H 'Content-Type: application/json' -d '{"username":"dslztx","age":33}'
