// import styles from './index.less';
import { Components } from "antd/lib/date-picker/generatePicker";
import axios from "axios";
import TableAjax from '../components/TableAjax';

export default function IndexPage() {
  
  let branchFilters:any = [];
  let tableData:any;
  axios({
    url: "/api/search",
    method: "get"
  }).then((data:any) => {
    // console.log(data.data.results);
    let branchArr:any = [];
    data.data.results.map((item:any)=>{
      branchArr.push(item.branchName)
    });
    [...new Set(branchArr)].map((item:any)=>{
      branchFilters.push({text:item,value:item,})
    });
    tableData=data.data.results
  });
  return (
    <div>
      <TableAjax data={tableData}  branchFilters={branchFilters}/>
    </div>
  );
}
