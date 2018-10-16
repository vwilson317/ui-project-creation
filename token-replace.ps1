 param (
    [string]$name = "ui",
	[string]$docker_repo_path = "",
    [string]$docker_service_name="web-ui",
    [bool]$test = $true)

$ignoreStr = "token-replace.ps1,main.ps1"

if($test){
    replace-in-file '{name}' $name '*' --ignore=$ignoreStr --verbose --dry
    replace-in-file '{docker_repo_path}' $docker_repo_path '*' --ignore=$ignoreStr --verbose --dry
    replace-in-file '{docker_service_name}' $docker_repo_path '*' --ignore=$ignoreStr --verbose --dry
}
else{
    replace-in-file '{name}' $name '*'  --ignore=$ignoreStr --verbose 
    replace-in-file '{docker_repo_path}' $docker_repo_path '*' --ignore=$ignoreStr --verbose 
    replace-in-file '{docker_service_name}' $docker_repo_path '*' --ignore=$ignoreStr --verbose
}