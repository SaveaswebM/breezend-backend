import "dotenv/config";

import express from 'express';
// import router from "./Routes";

const app = express();

const PORT = process.env.PORT || 3000

app.use(express.json())

app.use(express.urlencoded({extended:false}));

app.get("/", (req, res)=>{
    return res.send("Hi ");
})

import routes from "./Routes/userRoute.js";

app.use('/api',routes);

app.listen(PORT ,()=> console.log(`server is running PORT ${PORT}`))