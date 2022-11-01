#!bin/env bash
###
# @Author: yi_t marvelousme@163.com
# @Date: 2022-11-01 09:59:55
# @LastEditors: yi_t marvelousme@163.com
# @LastEditTime: 2022-11-01 09:59:56
# @FilePath: /zero-paopao/home/pz/go/src/paopao-ce/web/run.sh
# @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
###

docker stop paopaoweb
imgid=$(docker images | grep "paopao" | awk ' {print $3}')
docker rmi $imgid

yarn build

docker build -t your/paopao-ce:web --build-arg USE_DIST=yes .

docker run --name paopaoweb --rm -d -p 8010:80 your/paopao-ce:web
