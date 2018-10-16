 param ([string]$name = "ui",
 [string]$docker_repo_path = "vwilson/web/",
 [string]$docker_service_name="web-ui")

#template renamed
try{
    Rename-Item -Path "{name}.template" -NewName $name".template"
}
catch{
    "template file wasn't renamed"
}

vue create $name --default

.\token-replace.ps1 -name $name -test $true