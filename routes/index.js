module.exports = app => {
    app.get('/', (req, res) => {
      res.json({
        response: 'Api work'
      })
    });
  }