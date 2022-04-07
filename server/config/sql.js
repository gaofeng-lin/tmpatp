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


module.exports = { QUERY_SOLVER_INFO ,QUERY_CASE_LIST};