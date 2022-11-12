const mysql = require('mysql');
const db= mysql.createConnection({
    // Bases de entorno de pruebas, cambiar a localhost en entorno de producción
    // host : 'sql304.epizy.com',
    // user : 'epiz_32713686',
    // password : 'RR62IKi3VxD',
    // database : 'epiz_32713686_dbsicte',
    host : 'localhost',
    database : 'dbsiscte',
    user : 'root',
    password : '',
});

db.connect(function(err) {
    if (err) {
        console.error('Error de conexion: ' + err.stack);
        return;
    }
    console.log('Conectado con el identificador ' + db.threadId);
});

module.exports = db;