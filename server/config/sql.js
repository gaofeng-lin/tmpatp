const QUERY_SOLVER_INFO = `SELECT
                            t1.idsolver_info,
                            t1.solver_version,
                            t1.update_author,
                            t1.gitProject,
                            t1.branchName,
                            t1.svnDate,
                            t1.update_Log,
                            t1.next_Hashs,
                            IFNULL(t2.test_id, 0) AS test_id,
                            IFNULL(t2.system_case_errornum, 0) AS system_case_errornum,
                            IFNULL(t2.system_case_over, 0) AS system_case_over,
                            IFNULL(t2.system_case_num, 0) AS system_case_num,
                            IFNULL(t2.integration_case_errornum, 0) AS integration_case_errornum,
                            IFNULL(t2.integration_case_over, 0) AS integration_case_over,
                            IFNULL(t2.integration_case_num, 0) AS integration_case_num,
                            t3.state
                            FROM
                            solver_info AS t1
                            LEFT JOIN case_tests AS t2 ON t1.solver_version = t2.solver_version
                            LEFT JOIN compile_info AS t3 ON t1.idsolver_info = t3.idsolver_info
                            WHERE
                            t1.idsolver_info > 14
                            ORDER BY
                            t1.idsolver_info`;

const QUERY_CASE_LIST = `SELECT
                        t1.case_id,
                        t1.case_name,
                        IFNULL(t2.test_id, 0) AS case_exists
                        FROM
                        cases_system AS t1
                        LEFT JOIN (
                        SELECT
                            case_id,
                            test_id
                        FROM
                            testcases_system
                        WHERE
                            test_id=?
                        ) AS t2 ON t1.case_id = t2.case_id
                        `;

const QUERY_INTEGRATIONCASES_INFO = `SELECT * FROM cases`;
const QUERY_SYSTEMCASES_INFO = `SELECT * FROM cases_system`;

const QUERY_INTEGRATIONCASES_INFO_BYID =`SELECT
                                t2.solver_version,
                                t1.result_evaluation_ori,
                                t1.result_evaluation_pre,
                                t1.run_time
                                FROM
                                testcases_PHengLEIv3d0_Active AS t1
                                LEFT JOIN case_tests AS t2 ON t1.test_id = t2.test_id
                                WHERE
                                case_id=?
                                ORDER BY
	                            t2.solver_version DESC`;

const QUERY_SYSTEMCASES_INFO_BYID =`SELECT
                                t2.solver_version,
                                t1.result_evaluation_ori,
                                t1.result_evaluation_pre,
                                t1.run_time
                                FROM
                                testcases_system_cdcloud AS t1
                                LEFT JOIN case_tests AS t2 ON t1.test_id = t2.test_id
                                WHERE
                                case_id=?
                                ORDER BY
	                            t2.solver_version DESC`;

const QUERY_TEST = `SELECT param_name, var_type,var_name,var_value FROM person_param`;

const QUERY_PRODUCT = `SELECT product_name,cfdversion,product_info FROM products`;

module.exports = { 
    QUERY_SOLVER_INFO ,
    QUERY_CASE_LIST,
    QUERY_INTEGRATIONCASES_INFO,
    QUERY_SYSTEMCASES_INFO,
    QUERY_INTEGRATIONCASES_INFO_BYID,
    QUERY_SYSTEMCASES_INFO_BYID,
    QUERY_TEST,
    QUERY_PRODUCT,
};