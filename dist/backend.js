module.exports=function(e){function s(o){if(r[o])return r[o].exports;var t=r[o]={exports:{},id:o,loaded:!1};return e[o].call(t.exports,t,t.exports,s),t.loaded=!0,t.exports}var r={};return s.m=e,s.c=r,s.p="public",s(0)}([function(e,s,r){const o=r(2),t=r(4);var n=process.env.PORT||t.app.port;process.env.SCALE||t.app.scale;o.listen(n,console.log("Express listening on "+n))},function(e,s){e.exports=require("express")},function(e,s,r){(function(s){var o,t,n,i,u,c,a,p;u=r(1),p=r(10),a=r(8),i=r(7),t=r(5),n=r(6),o=u(),o.locals.ENV=process.env,c=o.locals.isDev="production"!==process.env.NODE_ENV,o.locals.tittle="nodefined",o.locals.email="stalinswag1@gmail.com",o.set("views",p.join(s,"src/views")),o.set("view engine","jade"),o.disable("x-powered-by"),o.locals.isDev&&o.use(a("dev")),o.locals.isDev||o.use(n()),o.use(t.json()),o.use(t.urlencoded({extended:!o.use(i())})),o.use(u["static"](p.join(s,"public"))),o.use("/",r(3)),o.use(function(e,s,r,o){return 404!==e.status,r.status(e.status||500),r.render("error",{error:e})}),e.exports=o}).call(s,"/")},function(e,s,r){var o,t,n;o=r(1),n=o.Router(),t=r(9),n.get("/stats/cpu",function(e,s){return s.json(t.cpus())}),n.get("/stats/arch",function(e,s){return s.json(t.arch())}),n.get("/",function(e,s){return s.send("<h1>It works!</h1>")}),e.exports=n},function(e,s){e.exports={app:{port:3e3,scale:2},firebase:{key:"",domain:"",storageBucket:""}}},function(e,s){e.exports=require("body-parser")},function(e,s){e.exports=require("compression")},function(e,s){e.exports=require("cookie-parser")},function(e,s){e.exports=require("morgan")},function(e,s){e.exports=require("os")},function(e,s){e.exports=require("path")}]);
//# sourceMappingURL=backend.js.map