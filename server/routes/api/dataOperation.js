const router = require('koa-router')()
const { query } = require('../../config/pool');
const { QUERY_SOLVER_INFO,QUERY_CASE_LIST} = require('../../config/sql');

//查询
// 测试时可简单创建 string: name, number: id, 自增主键id
router.get('/search', async ctx => {
    const data = await query(QUERY_SOLVER_INFO);
    ctx.body = data;
});

router.get('/searchCaseList', async ctx => {
    const request = ctx.request;
    const req_query = request.query;
    const test_id = req_query.test_id;
    const data = await query(QUERY_CASE_LIST, {test_id});
    ctx.body = data;
});

router.get('/searchSystemCaseInfo', async ctx => {
    const request = ctx.request;
    const req_query = request.query;
    const test_id = req_query.test_id;
    const QUERY_CASE_INFO = `SELECT
                        t1.test_case_id,
                        t1.case_id,
                        t1.test_id,
                        t1.project_dirpath,
                        t2.case_name,
                        t1.run_time,
                        t1.is_worked,
                        t1.state,
                        t1.result_evaluation_ori,
                        t1.result_evaluation_pre
                        FROM
                        testcases_system_cdcloud AS t1
                        LEFT JOIN cases_system AS t2 ON t1.case_id = t2.case_id
                        WHERE t1.test_id = `
                        + test_id +
                        ` order by  t1.case_id`;
    const data = await query(QUERY_CASE_INFO);
    ctx.body = data;
});

router.get('/searchIntegrationCaseInfo', async ctx => {
    const request = ctx.request;
    const req_query = request.query;
    const test_id = req_query.test_id;
    const QUERY_CASE_INFO = `SELECT
                        t1.test_case_id,
                        t1.case_id,
                        t1.test_id,
                        t1.project_dirpath,
                        t2.case_name,
                        t1.run_time,
                        t1.is_worked,
                        t1.state,
                        t1.result_evaluation_ori,
                        t1.result_evaluation_pre
                        FROM
                        testcases_PHengLEIv3d0_Active AS t1
                        LEFT JOIN cases AS t2 ON t1.case_id = t2.case_id
                        WHERE t1.test_id = `
                        + test_id +
                        ` order by  t1.case_id`;
    const data = await query(QUERY_CASE_INFO);
    ctx.body = data;
});



router.get('/checkShouldDownload', async ctx => {
    const res = ctx.request.query;
    const { test_case_id = 0,type="system"} = res;
    CHECKSQL = ""
    if(type == "system")
        CHECKSQL = "SELECT state FROM testcases_system_cdcloud  WHERE test_case_id="+test_case_id;
    else if(type == "integration")
        CHECKSQL = "SELECT state FROM testcases_PHengLEIv3d0_Active  WHERE test_case_id="+test_case_id;
    const data = await query(CHECKSQL);
    ctx.body = data;
});

// 改变状态
router.get('/applydownload', async ctx => {
    const res = ctx.request.query;
    const { test_case_id = 0,type="system"} = res;
    UODATEAPPLYSQL = ""
    if(type == "system")
        UODATEAPPLYSQL = "UPDATE testcases_system_cdcloud SET state=1 WHERE test_case_id="+test_case_id;
    else if(type == "integration")
        UODATEAPPLYSQL = "UPDATE testcases_PHengLEIv3d0_Active SET state=1 WHERE test_case_id="+test_case_id;
    const data = await query(UODATEAPPLYSQL);
    if(data.status == 200){
        ctx.body = {
            status: 200,
            msg: "申请成功",
        };
    }else{
        ctx.body = {
            status: 500,
            msg: "申请失败",
        };
    }
});

// 重算
router.post('/restart', async ctx => {
    const res = ctx.request.body;
    const { test_case_id = 0, is_error_case = false, test_id = 0 ,type="system"} = res;
    RESTART_SQL = ""
    if(type == "system")
        RESTART_SQL = "UPDATE testcases_system_cdcloud SET is_worked=2,run_time=0,result_evaluation_ori='',result_evaluation_pre='' WHERE test_case_id="+test_case_id;
    else if(type == "integration")
        RESTART_SQL = "UPDATE testcases_PHengLEIv3d0_Active SET is_worked=2,run_time=0,result_evaluation_ori='',result_evaluation_pre='' WHERE test_case_id="+test_case_id;
    UPDATE_CASE_NUM_SQL_WITHERROR = "UPDATE case_tests SET result_over=result_over-1,errorcase_num=errorcase_num-1 WHERE test_id="+test_id;
    UPDATE_CASE_NUM_SQL_WITHOUTERROR = "UPDATE case_tests SET result_over=result_over-1 WHERE test_id="+test_id;
    if(test_case_id) {
        const data = await query(RESTART_SQL);
        if(is_error_case){
            casedata = await query(UPDATE_CASE_NUM_SQL_WITHERROR);
            if(data && data.status && data.status === 200 && casedata && casedata.status && casedata.status === 200) {
                ctx.body = {
                    status: 200,
                    msg: "重算成功",
                };
            } else {
                ctx.body = data;
            }
        }
        else{
            casedata = await query(UPDATE_CASE_NUM_SQL_WITHOUTERROR);
            if(data && data.status && data.status === 200 && casedata && casedata.status && casedata.status === 200) {
                ctx.body = {
                    status: 200,
                    msg: "重算成功",
                };
            } else {
                ctx.body = data;
            }
        }
    }else{
        ctx.body = {
            status: 404,
            msg: "未设置test_id",
        };
    }
});
// 插入
// router.post('/save', async ctx => {
//     const res = ctx.request.body;
//     const { username = '', realname = '', password = '' } = res;
//     if(username && realname) {
//         const queryData = {
//             username,
//       realname,
//       password,
//         };
//         const data = await query(INSERT_SQL, queryData);
//         if(data && data.status && data.status === 200) {
//             ctx.body = {
//                 status: 200,
//                 msg: "操作成功",
//             };
//         } else {
//             ctx.body = data;
//         }
//     }
// });

// //更新
// router.post('/update', async ctx => {
//     const res = ctx.request.body;
//     const { username = '', id= 1 } = res;
//     if(username && id) {
//         const queryData = [username, id];
//         const data = await query(UPDATE_SQL, queryData);
//         if(data && data.status && data.status === 200) {
//             ctx.body = {
//                 status: 200,
//                 msg: "操作成功",
//             };
//         } else {
//             ctx.body = data;
//         }
//     }
// });

// //根据主键id 删除
// router.del('/delete', async ctx => {
//     const res = ctx.request.body;
//     const { id } = res;
//     if(id) {
//         const queryData = [id];
//         const data = await query(DELETE_SQL, queryData);
//         if(data && data.status && data.status === 200) {
//             ctx.body = {
//                 status: 200,
//                 msg: "操作成功",
//             };
//         } else {
//             ctx.body = data;
//         }
//     }
// });

module.exports = router;