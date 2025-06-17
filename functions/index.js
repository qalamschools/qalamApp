const functions = require("firebase-functions");
const admin = require("firebase-admin");
const nodemailer = require("nodemailer");
const gmailEmail = functions.config().gmail.email;
const gmailPassword = functions.config().gmail.password;
admin.initializeApp();

const transporter = nodemailer.createTransport({
  service: "Gmail",
  host: "smtp.gmail.com",
  port: 465,
  secure: true,
  auth: {
    user: gmailEmail,
    pass: gmailPassword,
  },
});

transporter.verify((error, success) => {
  if (error) {
    console.error("SMTP Config Error:", error);
  } else {
    console.log("SMTP Server is ready to take our messages", success);
  }
});

exports.sendEmail = functions.https.onCall(async (data, context) => {
  const mailOptions = {
    from: "alqalamschoolapps@gmail.com",
    to: "webadmin@qalam-academy.org",
    subject: data.subject,
    text: data.text,
  };

  try {
    await transporter.sendMail(mailOptions);
    return { success: true, message: "Email sent successfully" };
  } catch (error) {
    console.error("Email error:", error);
    throw new functions.https.HttpsError("internal", "Failed to send email");
  }
});
