const router = require('koa-router')()
 
//引入dataOperation下的子路由模块
const dataOperation = require('./api/dataOperation')
const getFiles = require('./api/getFiles')
 
//配置dataOperation下的子路由
router.get('/', async (ctx) => {
    ctx.body = "api接口"
})
router.use(dataOperation.routes(), dataOperation.allowedMethods())
router.use(getFiles.routes(), getFiles.allowedMethods())
module.exports = router;