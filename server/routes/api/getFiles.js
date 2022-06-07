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
        const fileContent = fs.readFileSync(path.join(staticErrorInfoPath,filename));
        ctx.body = fileContent;
        ctx.type = 'text/plain';
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
    let filename = ctx.request.query.filename;
    //获取资源文件的绝对路径
    let filePath = path.join("ATPCases",filename);
    let resHred = readFile(ctx.headers.range, filePath);
    ctx.status = resHred.code
    ctx.set(resHred.head);
    let stream = fs.createReadStream(filePath, resHred.code == 200 ? {} : { start: resHred.start, end: resHred.end });
    stream.pipe(ctx.res);
    // //也可使用这种方式。
    // stream.on('data', e => ctx.res.write(e));
    // // 接收完毕
    // stream.on('end', e => ctx.res.end());
    ctx.respond = false;
    return
    // const filename = ctx.request.query.filename;
    // ctx.set('Content-type', 'application/octet-stream');
    // ctx.set('Content-disposition', 'attachment; filename='+filename)
    // await send(ctx,path.join("ATPCases",filename));
});

 
/**
 * [读文件]
 * @param  {String} range        [数据起始位]
 * @param  {String} filePath     [文件路径]
 * @param  {Number} chunkSize    [每次请求碎片大小 （900kb 左右）]
 */
function readFile(range, filePath, chunkSize = 499999 * 2) {
    //mime类型
    const mime = {
        "css": "text/css",
        "gif": "image/gif",
        "html": "text/html",
        "ico": "image/x-icon",
        "jpeg": "image/jpeg",
        "jpg": "image/jpeg",
        "js": "text/javascript",
        "json": "application/json",
        "pdf": "application/pdf",
        "png": "image/png",
        "svg": "image/svg+xml",
        "swf": "application/x-shockwave-flash",
        "tiff": "image/tiff",
        "txt": "text/plain",
        "mp3": "audio/mp3",
        "wav": "audio/x-wav",
        "wma": "audio/x-ms-wma",
        "wmv": "video/x-ms-wmv",
        "xml": "text/xml",
        "mp4": "video/mp4",
		"zip":"application/octet-stream"
    };
    // 获取后缀名
    let ext = path.extname(filePath);
    ext = ext ? ext.slice(1) : 'unknown';
    //未知的类型一律用"text/plain"类型
    let contentType = mime[ext.toLowerCase()];
 
    //建立流对象，读文件
    let stat = fs.statSync(filePath)
    let fileSize = stat.size;
    let head = {
        code: 200,
        head: {
            'Content-Length': fileSize,
            'content-type': contentType,
        }
 
    };
    if (range) {
        // 大文件分片
        let parts = range.replace(/bytes=/, "").split("-");
        let start = parseInt(parts[0], 10);
        let end = parts[1] ? parseInt(parts[1], 10) : start + chunkSize;
        end = end > fileSize - 1 ? fileSize - 1 : end;
        chunkSize = (end - start) + 1;
        head = {
            code: 206,
            filePath,
            start,
            end,
            head: {
                'Content-Range': `bytes ${start}-${end}/${fileSize}`,
                'content-type': contentType,
                'Content-Length': chunkSize,
                'Accept-Ranges': 'bytes'
            }
        }
 
    }
    return head;
}


module.exports = router;