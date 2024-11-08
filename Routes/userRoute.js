import {Router} from "express";

import {createUser} from '../controller/UserController.js';

const  router  = Router();

router.post("/user",createUser);
router.get("/", (req, res)=>{
    return res.send("Hi ");
})

export default router;