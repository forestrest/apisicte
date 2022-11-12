const db = require("../db");

module.exports = (app) => {

    app.post("/corporativedata/", (req, res) => {
        const {
            cc,
            names,
            lastnames,
            document_city,
            document_type,
            phone1,
            phone2,
            corporative_email,
            personal_email,
            job_type,
        } = req.body;
        const query = `INSERT INTO corporative_data (document_number, document_type, document_city, names, lastnames, job_type) VALUES (?,?,?,?,?,?) `;
        db.query(
            query,
            [
                cc,
                names,
                lastnames,
                document_city,
                document_type,
                phone1,
                phone2,
                corporative_email,
                personal_email,
                job_type,
            ],
            (err, rows, fields) => {
                if (!err) {
                    res.json(rows);
                } else {

                    res.status(400).json(err);
                }
            }
        );
    });


    app.post("/contactdata/", (req, res) => {
        const {
            names,
            lastnames,
            document_city,
            document_type,
            phone1,
            phone2,
            corporative_email,
            personal_email
        } = req.body;
        const query = `INSERT INTO contacts_data(id_persona, phone1, phone2, corporative_email, personal_email) VALUES (?,?,?,?,?)`;
        db.query(
            query,
            [
                names,
                lastnames,
                document_city,
                document_type,
                phone1,
                phone2,
                corporative_email,
                personal_email
            ],
            (err, rows, fields) => {
                if (!err) {
                    res.json(rows);
                } else {
                    res.status(400).json(err);
                }
            }
        );
    });

    app.get("/corporative_data/", (req, res) => {
        db.query(
            `SELECT * FROM corporative_data `,
            (err, rows, fields) => {
                if (!err) {
                    res.json(rows);
                } else {
                    res.json(err);
                }
            }
        );
    });
};