#!/bin/bash

curl --http2-prior-knowledge -i -X GET 'http://localhost:8080/hello'
