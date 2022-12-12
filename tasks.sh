while getopts u:a:f: flag
do
    case "${flag}" in
        t) task_no=${OPTARG};;
    esac
done

if [ $task_no == 0 ]; then
  echo [INFO] Cleaning anaconda script.....
  rm -rf ./delete_anaconda_script
elif [ $task_no == 1 ]; then
  echo [INFO] Cleaning files that did not meet gitignore.....
  if [[ -f requirements.txt ]]; then
    rm -rf requirements.txt
  fi
  if [[ -f version.xml ]]; then
    rm -rf version.xml
  fi
  if [[ -f anaconda.xml ]]; then
    rm -rf anaconda.xml
  fi
elif [ $task_no == 2 ]; then
  sudo zypper install typescript htop
elif [ $task_no == 3 ]; then
  chmod 755 Makefile*
  chmod 755 Dockerfile*
elif [ $task_no == 4 ]; then
  sudo zypper install make
elif [ $task_no == 5 ]; then
  make tumbleweed
  make deps_instances
elif [ $task_no == 6 ]; then
  make leap
  make deps_instances
elif [ $task_no == 8 ]; then
  chmod 755 *.ts
  if [[ -f configurator.ts ]]; then
    ts-node configurator.ts
  fi
elif [ $task_no == 9 ]; then
  git clone https://github.com/cginternals/cppfs
  set path=$CD/cppfs
  cd $path
  pwd
  curl -fsSL https://get.docker.com -o get-docker.sh
  bash get-docker.sh
  docker build -f Dockerfile
  set current_directory=$CD
  cd $current_directory
  pwd
  echo Built.
  make docker_cleaner_instance
  ./docker_cleaner
  ts-node deleter.ts
else
  echo An error occured.
fi
