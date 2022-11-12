module.exports = app =>{
  app.set('port', process.env.PORT || 3000);
  app.set("Content-Type", "application/json");
  app.set("Access-Control-Allow-Origin", "*");
}