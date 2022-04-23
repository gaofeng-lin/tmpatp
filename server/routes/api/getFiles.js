const router = require('koa-router')()
const send = require('koa-send');
const fs = require('fs')
const archiver = require('archiver')
// const staticResultPath = "/home/helei/ATP/case_test/";
const path = require('path')
const staticResultPath = path.join(process.cwd(),"ATPCases/");
const staticErrorInfoPath = path.join(process.cwd(),"ErrorInfos/");
const sleep = require('sleep-promise');


const includeDir = ["bin","results"];
const includeExtName = [".dat",".plt"];
function checkPathInclude(path){
    let includeDirInPath = includeDir.filter( word => path.substr(path.length - 8, 8).includes( word ) );
    return includeDirInPath.length == 0 ? false:true;
}

function readFileList(filepath, filesList) {
    var files = fs.readdirSync(filepath);
    files.forEach(function (itm) {
        var stat = fs.statSync(filepath +"/"+ itm);
        if (stat.isDirectory()) {
        //递归读取文件
            if(includeDir.indexOf(itm) != -1)
                readFileList(filepath +"/"+ itm + "/", filesList)
        } else if(checkPathInclude(filepath)){
            if(filepath.indexOf("results") != -1 && !includeExtName.includes(path.extname(itm)))
                return;
            var obj = {};//定义一个对象存放文件的路径和名字
            obj.path = filepath;//路径
            obj.filename = itm//名字
            obj.basename = path.basename(filepath)
            filesList.push(obj);
        }
    })
}

// 获取所有results文件
router.get('/checkResultsDirExists', async ctx => {
    const filename = ctx.request.query.filename;
    
    if (fs.existsSync(path.join(staticResultPath,filename))) {
        ctx.body =  {status:200,msg:'File exists.'};;
    } else {
        ctx.body =  {status:404,msg:'The file does not exist.'};;
    }
});


router.get('/getLoadFile', async ctx => {
    const filename = ctx.request.query.filename;
    
    if (fs.existsSync(path.join(staticErrorInfoPath,filename))) {
        const fileContent = fs.readFileSync(path.join(staticErrorInfoPath,filename), "binary");
        ctx.body = {status:200,msg:'Get file success.',content:fileContent};
    } else {
        ctx.body =  {status:404,msg:'The file does not exist.'};
    }
});
// router.get('/getResults', async ctx => {
//     const req_query = ctx.request.query;
//     const case_name = req_query.case_name;
//     const project_dirpath = req_query.project_dirpath;
//     const solver_version = req_query.solver_version;
//     const excludeFiles = req_query.excludeFiles;

//     if (project_dirpath.indexOf(staticResultPath) == -1) {
//         await send(ctx,"badRequest.zip");
//     } else {
//         const downloadRoot = project_dirpath
//         const zipName = solver_version + "_" +case_name+".zip";
//         var filesList = [];
//         readFileList(downloadRoot, filesList);
//         const zipStream = fs.createWriteStream(zipName);
//         const zip = archiver("zip");
//         zip.pipe(zipStream);
//         for (let i = 0; i < filesList.length; i++) {
//             // 添加单个文件到压缩包
//             let name = filesList[i]["filename"]
//             if(excludeFiles.indexOf(name) == -1)
//                 zip.append(fs.createReadStream(filesList[i]["path"]+"/"+name), { name: filesList[i]["basename"]+"/"+name })
//         }
//         await zip.finalize();
//         ctx.attachment(decodeURI(zipName));
//         await sleep(500);
//         await send(ctx,zipName);
//     }
// });

router.get('/getResults', async ctx => {
    const zipName = ctx.request.query.filename;
    await send(ctx,path.join("ATPCases",zipName));
});


module.exports = router;