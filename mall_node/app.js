import { _mysql } from "./mysql"
const express = require('express');
const app = express();
const bodyParser = require('body-parser');

app.use(bodyParser.json()); // for parsing application/json
app.use(bodyParser.urlencoded({ extended: true })); // for parsing application/x-www-form-urlencoded
//设置跨域
app.all('*', function (req, res, next) {
   res.header("Access-Control-Allow-Origin", "*");
   res.header("Access-Control-Allow-Headers", "Accept,Accept-Encoding,Accept-Language,Connection,Content-Length,Content-Type, Cookie,Host,Origin,Referer,User-Agent, Authorization,X-Requested-With");
   res.header("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS");
   res.header("X-Powered-By", ' 3.2.1');
   res.header("Content-Type", "application/json;charset=utf-8");
   res.header("Access-Control-Allow-Credentials", "true")
   next();
});

//登录
app.post('/api/mall/user/login', function (req, res, next) {
    let getdata = req.body.params
    let mysql = new _mysql(getdata)
 
    mysql.userLogin(function (error, data, fields) {
       if (error) {
          res.json({ res: 1, message: '登录失败' })
          next(error);
       } else {
          console.log("log:" + "登录成功");
          res.status(200)
          res.json({ res: 0, message: '登录成功', data: data })
       }
       mysql.close()
    })
 })

//注册







app.get('/api/blog/search_list', function (req, res, next) {
    let getdata = JSON.parse(req.query.params)
    let mysql = new _mysql(getdata)
 
    mysql.getSearchList(function (error, data, fields) {
       if (error) {
          res.json({ res: 1, message: '请求失败' })
          next(error);
       } else {
          console.log("log:" + "搜索列表请求成功");
          res.status(200)
          res.json({ res: 0, message: '请求处理成功', data: data })
       }
       mysql.close()
    })
 })