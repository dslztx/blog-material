#!/bin/python

# h2c_server.py
import json

from starlette.applications import Starlette
from starlette.responses import PlainTextResponse
from starlette.routing import Route


async def homepage(request):
    return PlainTextResponse("Hello HTTP/2 (h2c)")


async def hello(request):
    # 对应 UserController.hello()
    return PlainTextResponse("Hello World! Welcome to visit dslztx.com")


async def add_user(request):
    # 对应 UserController.addUser(@RequestBody User user)，仅 POST
    try:
        user = await request.json()
    except Exception:
        user = None

    # 对应 ObjectAssist.isNotNull(user) 判断
    if user is None or not isinstance(user, dict):
        return PlainTextResponse("NULL")

    # 对应 User.toString()，即 FastJSON 序列化结果（默认忽略 null 字段）
    result = {key: user.get(key) for key in ("username", "age") if user.get(key) is not None}
    return PlainTextResponse(json.dumps(result, ensure_ascii=False, sort_keys=True))


app = Starlette(routes=[
    Route("/", homepage),
    Route("/hello", hello, methods=["GET"]),
    Route("/addUser", add_user, methods=["POST"]),
])

if __name__ == "__main__":
    import asyncio
    from hypercorn.asyncio import serve
    from hypercorn.config import Config

    config = Config()
    config.bind = ["0.0.0.0:8080"]
    # Hypercorn 默认支持 h2c 升级，不需要额外开 SSL 配置
    asyncio.run(serve(app, config))
