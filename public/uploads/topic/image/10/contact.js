module.exports = function (req, res) {
    var request = require('superagent');
    request
        .post('https://hooks.slack.com/services/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')
        .send({ "text": "お問い合わせがありました！" })
        .end(function (err, res) {
            console.log(res);
        })
});