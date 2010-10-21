#!/usr/bin/bash

rails g scaffold Task url:string path:string environment:string class_name:string record_id:integer method:string parameters:string state:string priority:integer references:worker 
rails g scaffold Worker af:string port:integer host:string addr:string state:string task:references
