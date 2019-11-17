//数据库类
export class _mysql {
    constructor(getdata) {
        this.mysql = require('mysql');
        this.getData = getdata;
        this.connection = this.mysql.createConnection({
            host: 'localhost',
            user: 'root',  //用户名
            password: '',   //密码
            database: 'mall',
            port: '3306'     //端口号
        });


    }
    connect() {
        this.connection.connect(function (err) {
            if (err) {
                console.log('---:' + err);
                return;
            }
            console.log('连接succeed');
        });
    }
    //注册
    addUser(callback) {
        this.connection.query('insert into t_user (userName,phone,passWord,email,permission,introduce) value(?,?,?,?,0,?)',
            [this.getData.user_name, this.getData.phone, this.getData.password, this.getData.email, this.getData.introduce],
            function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //登录
    userLogin(callback) {
        this.connection.query('select * from t_user where phone=? and passWord = ?',
            [this.getData.phone, this.getData.pass_word],
            function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //判断手机号是否存在
    selectUser(callback) {
        this.connection.query('select * from t_user where phone=?', [this.getData.phone], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //根据id查询用户信息
    getUserById(callback) {
        this.connection.query('select * from t_user where id=?', [this.getData.userId], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //获取用户列表
    getUserList(callback) {
        this.connection.query('select * from t_user', [], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //农产品模糊查询
    searchGoods(callback) {
        this.connection.query("select * from t_goods_info where goods_name like '% " + this.getData.search + "%' or goods_name like  '% " + this.getData.search + " %' and is_shop = 1",
            [], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //根据分类获取商品列表
    getGoodsBySort(callback) {
        this.connection.query('select * from t_goods_info where sort_id = ? and is_shop= 1', [this.getData.sortId], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //根据id获取商品信息
    getGoodsInfoById(callback) {
        this.connection.query('select * from t_goods_info where id = ? ', [this.getData.goodsId], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //发布商品
    addGoods(callback) {
        this.connection.query('insert into t_goods_info (goods_name,goods_info,goods_img,goods_bigimg,price,user_id,sort_id,send_palce,shop_id,is_shop,shipping) value (?,?,?,?,?,?,?,?,?,?,?)',
            [this.getData.goodsName, this.getData.goodsInfo, this.getData.goodsImg, this.getData.goodsBigImg, this.getData.price,
            this.getData.userId, this.getData.sortId, this.getData.sendPlace, this.getData.shopId, this.getData.isShop, this.getData.shipping], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //商品上架
    goodsAddShop(callback) {
        this.connection.query('update t_goods_info set is_ship = 1 where id = ?', [this.getData.goodsId], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //商品下架
    goodsRemoveShop(callback) {
        this.connection.query('update t_goods_info set is_ship = 0 where id = ?', [this.getData.goodsId], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }

    //修改农产品价格
    updateGoodsPrice(callback) {
        this.connection.query('update t_goods_info set now_price = ? where id = ?', [this.getData.nowPrice, this.getData.goodsId], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //修改农产品信息
    updateGoodsInfo(callback) {
        this.connection.query('update t_goods_info set goods_name=?,goods_info=?,goods_img=?,goods_bigimg=?,price=?,sort_id=?,send_palce=?,shipping=? where id = ?',
            [this.getData.goodsName, this.getData.goodsInfo, this.getData.goodsImg, this.getData.goodsBigImg, this.getData.price,
                 this.getData.sortId, this.getData.sendPlace, this.getData.shipping], function (err, rs, fields) {
                console.log(rs)
                return callback(err, rs, fields)
            })
    }
    //获取购物车信息
    getShoppingCartInfo(callback) {
        this.connection.query('select * from t_shoppingcart_info where user_id = ?', [this.getData.userId], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //加入购物车
    addShoppingCart(callback) {
        this.connection.query('insert into t_shoppingcart_info (user_id,goods_id,count) value (?,?,?)', [this.getData.nowPrice, this.getData.goodsId], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //修改购物车商品数量
    updateShoppingCartCount(callback) {
        this.connection.query('update t_shoppingcart_info set count = ?', [this.getData.count], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //移除购物车商品
    deleteShoppingCartCount(callback) {
        this.connection.query('delete from t_shoppingcart_info where id = ?', [this.getData.cartGoodsId], function (err, rs, fields) {
            console.log(rs)
            return callback(err, rs, fields)
        })
    }
    //商品结算
    

    
    //根据ID查询用户信息
    selectUser(callback) {
        this.connection.query('select * from user where user_id = ?', [this.getData.user_id],
            function (err, rs, fields) {
                return callback(err, rs, fields)
            })
    }
    //修改个人信息
    updateUser(callback) {
        this.connection.query('update user set user_name = ?,introduction = ?,detail = ?,email = ?,age = ? where user_id = ?',
            [this.getData.user_name, this.getData.introduction, this.getData.detail, this.connection.email, this.getData.age, this.getData.user_id],
            function (err, rs, fields) {
                return callback(err, rs, fields)
            })
    }
}