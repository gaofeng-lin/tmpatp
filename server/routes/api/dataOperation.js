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

reAction = (test_case_id,test_id,type,actionType) =>{
    RESTART_SQL = ""
    UPDATE_CASE_NUM_SQL_WITHERROR = "";
    UPDATE_CASE_NUM_SQL_WITHOUTERROR = "";
    workstate = '';
    if(actionType=="restart")
    {
        workstate = '2';
    }
    if(type == "system")
    {
        RESTART_SQL = "UPDATE testcases_system_cdcloud SET is_worked="+workstate+",run_time=0,result_evaluation_ori='',result_evaluation_pre='',value_withpre='',value_withori='' WHERE test_case_id="+test_case_id;
        UPDATE_CASE_NUM_SQL_WITHERROR = "UPDATE case_tests SET system_case_over=system_case_over-1,system_case_errornum=system_case_errornum-1 WHERE test_id="+test_id;
        UPDATE_CASE_NUM_SQL_WITHOUTERROR = "UPDATE case_tests SET system_case_over=system_case_over-1 WHERE test_id="+test_id;
    }   
    else if(type == "integration")
    {
        RESTART_SQL = "UPDATE testcases_PHengLEIv3d0_Active SET is_worked="+workstate+",run_time=0,result_evaluation_ori='',result_evaluation_pre='',value_withpre='',value_withori='' WHERE test_case_id="+test_case_id;
        UPDATE_CASE_NUM_SQL_WITHERROR = "UPDATE case_tests SET integration_case_over=integration_case_over-1,integration_case_errornum=integration_case_errornum-1 WHERE test_id="+test_id;
        UPDATE_CASE_NUM_SQL_WITHOUTERROR = "UPDATE case_tests SET integration_case_over=integration_case_over-1 WHERE test_id="+test_id;
    }

    return  [RESTART_SQL,UPDATE_CASE_NUM_SQL_WITHERROR,UPDATE_CASE_NUM_SQL_WITHOUTERROR]
    
}
// 重算
router.post('/restart', async ctx => {
    const res = ctx.request.body;
    const { test_case_id = 0, is_error_case = false, test_id = 0 ,type="system"} = res;
    RESTART_SQL = ""
    UPDATE_CASE_NUM_SQL_WITHERROR = "";
    UPDATE_CASE_NUM_SQL_WITHOUTERROR = "";
    if(test_case_id) {
        [RESTART_SQL,UPDATE_CASE_NUM_SQL_WITHERROR,UPDATE_CASE_NUM_SQL_WITHOUTERROR] = reAction(test_case_id,test_id,type,'restart')
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

//webhook
router.post('/webhook', async ctx => {
    const res = ctx.request.body;
    console.log(res);
    //res内容
    // {
    //     "ref":"refs/heads/master"
    //     "before":"b1ce76f76ac3b80e4a3760b7d55e54dc6b5f66ec"
    //     "after":"b1ce76f76ac3b80e4a3760b7d55e54dc6b5f66ec"
    //     "compare_url":""
    //     "commits":[
    //     0:{
    //     "id":"b1ce76f76ac3b80e4a3760b7d55e54dc6b5f66ec"
    //     "message":"master分支更新PHengLEI2112.v9198版本 "
    //     "url":"https://git.osredm.com/p68217053/PHengLEI/commit/b1ce76f76ac3b80e4a3760b7d55e54dc6b5f66ec"
    //     "author":{
    //     "name":"hexianyao"
    //     "email":"371008816@qq.com"
    //     "username":"p52791048"
    //     }
    //     "committer":{
    //     "name":"hexianyao"
    //     "email":"371008816@qq.com"
    //     "username":"p52791048"
    //     }
    //     "verification":{
    //     "verified":false
    //     "reason":"gpg.error.not_signed_commit"
    //     "signature":""
    //     "signer":NULL
    //     "payload":""
    //     }
    //     "timestamp":"2021-12-31T08:50:32+08:00"
    //     "added":NULL
    //     "removed":NULL
    //     "modified":NULL
    //     }
    //     ]
    //     "head_commit":{
    //     "id":"b1ce76f76ac3b80e4a3760b7d55e54dc6b5f66ec"
    //     "message":"master分支更新PHengLEI2112.v9198版本 "
    //     "url":"https://git.osredm.com/p68217053/PHengLEI/commit/b1ce76f76ac3b80e4a3760b7d55e54dc6b5f66ec"
    //     "author":{
    //     "name":"hexianyao"
    //     "email":"371008816@qq.com"
    //     "username":"p52791048"
    //     }
    //     "committer":{
    //     "name":"hexianyao"
    //     "email":"371008816@qq.com"
    //     "username":"p52791048"
    //     }
    //     "verification":{
    //     "verified":false
    //     "reason":"gpg.error.not_signed_commit"
    //     "signature":""
    //     "signer":NULL
    //     "payload":""
    //     }
    //     "timestamp":"2021-12-31T08:50:32+08:00"
    //     "added":NULL
    //     "removed":NULL
    //     "modified":NULL
    //     }
    //     "repository":{
    //     "id":382
    //     "owner":{
    //     "id":113
    //     "login":"p68217053"
    //     "full_name":""
    //     "email":"phenglei@126.com"
    //     "avatar_url":"https://git.osredm.com/user/avatar/p68217053/-1"
    //     "language":""
    //     "is_admin":false
    //     "last_login":"0001-01-01T00:00:00Z"
    //     "created":"2021-01-26T09:20:08+08:00"
    //     "restricted":false
    //     "active":false
    //     "prohibit_login":false
    //     "location":""
    //     "website":""
    //     "description":""
    //     "visibility":"public"
    //     "followers_count":0
    //     "following_count":0
    //     "starred_repos_count":0
    //     "username":"p68217053"
    //     }
    //     "name":"PHengLEI"
    //     "full_name":"p68217053/PHengLEI"
    //     "description":""
    //     "empty":false
    //     "private":true
    //     "fork":false
    //     "template":false
    //     "parent":NULL
    //     "mirror":false
    //     "size":362318
    //     "html_url":"https://git.osredm.com/p68217053/PHengLEI"
    //     "ssh_url":"git@git.osredm.com:p68217053/PHengLEI.git"
    //     "clone_url":"https://git.osredm.com/p68217053/PHengLEI.git"
    //     "original_url":""
    //     "website":""
    //     "stars_count":0
    //     "forks_count":316
    //     "watchers_count":1
    //     "open_issues_count":0
    //     "open_pr_counter":4
    //     "release_counter":1
    //     "default_branch":"master"
    //     "archived":false
    //     "created_at":"2021-01-26T09:28:44+08:00"
    //     "updated_at":"2022-04-08T11:48:46+08:00"
    //     "permissions":{
    //     "admin":false
    //     "push":false
    //     "pull":false
    //     }
    //     "has_issues":true
    //     "internal_tracker":{
    //     "enable_time_tracker":true
    //     "allow_only_contributors_to_track_time":true
    //     "enable_issue_dependencies":true
    //     }
    //     "has_wiki":true
    //     "has_pull_requests":true
    //     "has_projects":false
    //     "ignore_whitespace_conflicts":false
    //     "allow_merge_commits":true
    //     "allow_rebase":true
    //     "allow_rebase_explicit":true
    //     "allow_squash_merge":true
    //     "default_merge_style":"merge"
    //     "avatar_url":""
    //     "internal":false
    //     "mirror_interval":""
    //     }
    //     "pusher":{
    //     "id":113
    //     "login":"p68217053"
    //     "full_name":""
    //     "email":"phenglei@126.com"
    //     "avatar_url":"https://git.osredm.com/user/avatar/p68217053/-1"
    //     "language":""
    //     "is_admin":false
    //     "last_login":"0001-01-01T00:00:00Z"
    //     "created":"2021-01-26T09:20:08+08:00"
    //     "restricted":false
    //     "active":false
    //     "prohibit_login":false
    //     "location":""
    //     "website":""
    //     "description":""
    //     "visibility":"public"
    //     "followers_count":0
    //     "following_count":0
    //     "starred_repos_count":0
    //     "username":"p68217053"
    //     }
    //     "sender":{
    //     "id":113
    //     "login":"p68217053"
    //     "full_name":""
    //     "email":"phenglei@126.com"
    //     "avatar_url":"https://git.osredm.com/user/avatar/p68217053/-1"
    //     "language":""
    //     "is_admin":false
    //     "last_login":"0001-01-01T00:00:00Z"
    //     "created":"2021-01-26T09:20:08+08:00"
    //     "restricted":false
    //     "active":false
    //     "prohibit_login":false
    //     "location":""
    //     "website":""
    //     "description":""
    //     "visibility":"public"
    //     "followers_count":0
    //     "following_count":0
    //     "starred_repos_count":0
    //     "username":"p68217053"
    //     }
    //     }

});

// 重分析
router.post('/reanalysis', async ctx => {
    const res = ctx.request.body;
    const { test_case_id = 0, is_error_case = false, test_id = 0 ,type="system"} = res;
    if(test_case_id) {
        [RESTART_SQL,UPDATE_CASE_NUM_SQL_WITHERROR,UPDATE_CASE_NUM_SQL_WITHOUTERROR] = reAction(test_case_id,test_id,type,'reanalysis')
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