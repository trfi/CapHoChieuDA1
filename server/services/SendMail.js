var nodemailer = require('nodemailer')

var transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: '1923402010231@student.tdmu.edu.vn',
    pass: 'Tt147369@'
  }
})

// var mailOptions = {
//   from: '1923402010231@student.tdmu.edu.vn',
//   to: 'myfriend@yahoo.com',
//   subject: 'Sending Email using Node.js',
//   text: 'That was easy!'
// }

const sendMail = (mailOptions) => {
  transporter.sendMail(mailOptions, function(error, info){
    if (error) {
      console.log(error)
    } else {
      console.log('Email sent: ' + info.response);
    }
  })
}

module.exports = sendMail