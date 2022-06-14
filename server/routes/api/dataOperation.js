const router = require('koa-router')()
const { query } = require('../../config/pool');
const { QUERY_SOLVER_INFO, QUERY_CASE_LIST,QUERY_INTEGRATIONCASES_INFO,QUERY_SYSTEMCASES_INFO,QUERY_PARAMS,QUERY_PRODUCT } = require('../../config/sql');
const {test} = require('../../config/testdb');
const {testQuery} = require('../../config/testdb');


//查询产品表
router.get('/testproduct', async ctx => {
    var res = [];
    const data = await testQuery(QUERY_PRODUCT);
    for (var i = 0; i < data.results.length; i++) {
        data.results[i].key = i+1
        res[i] = data.results[i];
    }

    ctx.body = res

});

//查询参数表表
router.get('/testparam', async ctx => {
    var res = [];
    const data = await testQuery(QUERY_PARAMS);
    var index = 0;
    for (var i = 0; i < data.results.length; i++) {
        data.results[i].key = i+1
        res[i] = data.results[i];
    }

    console.log(res)
    ctx.body = res

});


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
    const data = await query(QUERY_CASE_LIST, { test_id });
    ctx.body = data;
});

router.get('/searchCases', async ctx => {
    const request = ctx.request;
    const req_type = request.query.type;
    let QUERYSTR="";
    console.log("req_type: ",req_type)
    if(req_type=="integrationCase")
        QUERYSTR = QUERY_INTEGRATIONCASES_INFO
    if(req_type=="systemCase")
        QUERYSTR = QUERY_SYSTEMCASES_INFO
    const data = await query(QUERYSTR);
    ctx.body = data;
});

router.get('/searchCaseByID', async ctx => {
    const request = ctx.request;
    const req_type = request.query.type;
    const case_id = request.query.case_id;
    let QUERYSTR="";
    if(req_type=="integrationCase")
        QUERYSTR = `SELECT
        t2.solver_version,
        t1.result_evaluation_ori,
        t1.result_evaluation_pre,
        t1.run_time
        FROM
        testcases_PHengLEIv3d0_Active AS t1
        LEFT JOIN case_tests AS t2 ON t1.test_id = t2.test_id
        WHERE
        case_id=`
        + case_id +
        ` ORDER BY
        t2.solver_version DESC`;

    if(req_type=="systemCase")
        QUERYSTR = `SELECT
        t2.solver_version,
        t1.result_evaluation_ori,
        t1.result_evaluation_pre,
        t1.run_time
        FROM
        testcases_system_cdcloud AS t1
        LEFT JOIN case_tests AS t2 ON t1.test_id = t2.test_id
        WHERE
        case_id=`
        + case_id +
        ` ORDER BY
        t2.solver_version DESC`;
    const data = await query(QUERYSTR);
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
                        t1.end_time,
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
                        t1.end_time,
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
    const { test_case_id = 0, type = "system" } = res;
    CHECKSQL = ""
    if (type == "system")
        CHECKSQL = "SELECT state FROM testcases_system_cdcloud  WHERE test_case_id=" + test_case_id;
    else if (type == "integration")
        CHECKSQL = "SELECT state FROM testcases_PHengLEIv3d0_Active  WHERE test_case_id=" + test_case_id;
    const data = await query(CHECKSQL);
    ctx.body = data;
});
// 改变状态
router.get('/applydownload', async ctx => {
    const res = ctx.request.query;
    const { test_case_id = 0, type = "system" } = res;
    UODATEAPPLYSQL = ""
    if (type == "system")
        UODATEAPPLYSQL = "UPDATE testcases_system_cdcloud SET state=1 WHERE test_case_id=" + test_case_id;
    else if (type == "integration")
        UODATEAPPLYSQL = "UPDATE testcases_PHengLEIv3d0_Active SET state=1 WHERE test_case_id=" + test_case_id;
    const data = await query(UODATEAPPLYSQL);
    if (data.status == 200) {
        ctx.body = {
            status: 200,
            msg: "申请成功",
        };
    } else {
        ctx.body = {
            status: 500,
            msg: "申请失败",
        };
    }
});

reAction = (test_case_id, test_id, type, actionType) => {
    RESTART_SQL = ""
    UPDATE_CASE_NUM_SQL_WITHERROR = "";
    UPDATE_CASE_NUM_SQL_WITHOUTERROR = "";
    workstate = '';
    if (actionType == "restart") {
        workstate = '2';
    }
    if (type == "system") {
        RESTART_SQL = "UPDATE testcases_system_cdcloud SET is_worked=" + workstate + ",run_time=0,result_evaluation_ori='',result_evaluation_pre='',value_withpre='',value_withori='',state=0 WHERE test_case_id=" + test_case_id;
        UPDATE_CASE_NUM_SQL_WITHERROR = "UPDATE case_tests SET system_case_over=system_case_over-1,system_case_errornum=system_case_errornum-1 WHERE test_id=" + test_id;
        UPDATE_CASE_NUM_SQL_WITHOUTERROR = "UPDATE case_tests SET system_case_over=system_case_over-1 WHERE test_id=" + test_id;
    }
    else if (type == "integration") {
        RESTART_SQL = "UPDATE testcases_PHengLEIv3d0_Active SET is_worked=" + workstate + ",run_time=0,result_evaluation_ori='',result_evaluation_pre='',value_withpre='',value_withori='',state=0 WHERE test_case_id=" + test_case_id;
        UPDATE_CASE_NUM_SQL_WITHERROR = "UPDATE case_tests SET integration_case_over=integration_case_over-1,integration_case_errornum=integration_case_errornum-1 WHERE test_id=" + test_id;
        UPDATE_CASE_NUM_SQL_WITHOUTERROR = "UPDATE case_tests SET integration_case_over=integration_case_over-1 WHERE test_id=" + test_id;
    }

    return [RESTART_SQL, UPDATE_CASE_NUM_SQL_WITHERROR, UPDATE_CASE_NUM_SQL_WITHOUTERROR]

}
// 重算
router.post('/restart', async ctx => {
    const res = ctx.request.body;
    const { test_case_id = 0, is_error_case = false, test_id = 0, type = "system" } = res;
    RESTART_SQL = ""
    UPDATE_CASE_NUM_SQL_WITHERROR = "";
    UPDATE_CASE_NUM_SQL_WITHOUTERROR = "";
    if (test_case_id) {
        [RESTART_SQL, UPDATE_CASE_NUM_SQL_WITHERROR, UPDATE_CASE_NUM_SQL_WITHOUTERROR] = reAction(test_case_id, test_id, type, 'restart')
        const data = await query(RESTART_SQL);
        if (is_error_case) {
            casedata = await query(UPDATE_CASE_NUM_SQL_WITHERROR);
            if (data && data.status && data.status === 200 && casedata && casedata.status && casedata.status === 200) {
                ctx.body = {
                    status: 200,
                    msg: "重算成功",
                };
            } else {
                ctx.body = data;
            }
        }
        else {
            casedata = await query(UPDATE_CASE_NUM_SQL_WITHOUTERROR);
            if (data && data.status && data.status === 200 && casedata && casedata.status && casedata.status === 200) {
                ctx.body = {
                    status: 200,
                    msg: "重算成功",
                };
            } else {
                ctx.body = data;
            }
        }
    } else {
        ctx.body = {
            status: 404,
            msg: "未设置test_id",
        };
    }
});

//webhook
router.post('/webhook', async ctx => {
    const res = ctx.request.body;
    username = res?.commits[0]?.author?.name;
    if (username) {
        UODATEAPPLYSQL = "UPDATE user_info SET Check_Sign=Check_Sign+1 WHERE user_name='" + username + "'";
        data = await query(UODATEAPPLYSQL);
        if (data && data.status && data.status === 200) {
            ctx.body = {
                status: 200,
                msg: "更新webhook成功",
            };
        } else {
            ctx.body = {
                status: 404,
                msg: "更新webhook失败",
            };
        }
    } else {
        ctx.body = {
            status: 406,
            msg: "没有更新用户",
        };
    }

});

// 重分析
router.post('/reanalysis', async ctx => {
    const res = ctx.request.body;
    const { test_case_id = 0, is_error_case = false, test_id = 0, type = "system" } = res;
    if (test_case_id) {
        [RESTART_SQL, UPDATE_CASE_NUM_SQL_WITHERROR, UPDATE_CASE_NUM_SQL_WITHOUTERROR] = reAction(test_case_id, test_id, type, 'reanalysis')
        const data = await query(RESTART_SQL);
        if (is_error_case) {
            casedata = await query(UPDATE_CASE_NUM_SQL_WITHERROR);
            if (data && data.status && data.status === 200 && casedata && casedata.status && casedata.status === 200) {
                ctx.body = {
                    status: 200,
                    msg: "重算成功",
                };
            } else {
                ctx.body = data;
            }
        }
        else {
            casedata = await query(UPDATE_CASE_NUM_SQL_WITHOUTERROR);
            if (data && data.status && data.status === 200 && casedata && casedata.status && casedata.status === 200) {
                ctx.body = {
                    status: 200,
                    msg: "重算成功",
                };
            } else {
                ctx.body = data;
            }
        }
    } else {
        ctx.body = {
            status: 404,
            msg: "未设置test_id",
        };
    }
});



// 获取正在计算的作业列表
router.get('/getRunningJobs', async ctx => {
    const res = ctx.request.query;
    const { type = "systemCase" } = res;
    getRunningJobsSQL = ""
    if (type == "systemCase")
        getRunningJobsSQL = `SELECT
            t1.test_case_id,t2.solver_version,t3.case_name,t1.start_time
        FROM
        testcases_system_cdcloud AS t1
        LEFT JOIN case_tests AS t2 ON t1.test_id = t2.test_id
        LEFT JOIN cases AS t3 ON t1.case_id=t3.case_id
        WHERE 
            t1.is_worked=6
        ORDER BY
            t1.test_case_id DESC`;
    else if (type == "integrationCase")
        getRunningJobsSQL = `SELECT
            t1.test_case_id,t2.solver_version,t3.case_name,t1.start_time
        FROM
        testcases_PHengLEIv3d0_Active AS t1
        LEFT JOIN case_tests AS t2 ON t1.test_id = t2.test_id
        LEFT JOIN cases AS t3 ON t1.case_id=t3.case_id
        WHERE 
            t1.is_worked=6
        ORDER BY
            t1.test_case_id DESC`;
    const data = await query(getRunningJobsSQL);
    ctx.body = data;
});

// 取消正在计算的作业
router.post('/cancelJobs', async ctx => {
    const res = ctx.request.body;
    const { test_case_ids = [],  type = "system" } = res;
    const updateCases = '('+test_case_ids.join(',')+')';
    if (updateCases != '()') {
        cancelSQL = ''
        if (type == "systemCase")
        cancelSQL =  `UPDATE testcases_system_cdcloud SET is_worked=10 WHERE test_case_id in `+updateCases;
        else if (type == "integrationCase")
        cancelSQL = `UPDATE testcases_PHengLEIv3d0_Active SET is_worked=10 WHERE test_case_id in `+updateCases;
        data = await query(cancelSQL);
        if (data && data?.status === 200) {
            ctx.body = {
                status: 200,
                msg: "取消作业成功",
            };
        } else {
            ctx.body = {
                status: 404,
                msg: "取消作业失败",
            };
        }
    } else {
        ctx.body = {
            status: 404,
            msg: "未设置test_id",
        };
    }
});




module.exports = router;