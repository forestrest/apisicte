module.exports = app => {
  // Server start
  app.listen(app.get('port'), () =>{
    console.log('Server on port', app.get('port'))
  })
}