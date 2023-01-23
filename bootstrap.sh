# Prompt for Git branch
GIT_BRANCH="${GIT_BRANCH:-}"
if [ -z "${GIT_BRANCH}" ]
then
  echo -n "Git Branch Name: [dev-sr] "
  read GIT_BRANCH
fi
if [ -z "${GIT_BRANCH}" ]
then
  GIT_BRANCH="dev-sr"
fi

REPO="-b ${GIT_BRANCH} --single-branch https://github.com/srasiahirm/10kft-api.git"

# Prompt for RM project folder name
RM_PROJECT_FOLDER="${RM_PROJECT_FOLDER:-}"
while [ -z "${RM_PROJECT_FOLDER}" ]
do
  echo -n "Project Folder Name: "
  read RM_PROJECT_FOLDER
done

if [ -e ${RM_PROJECT_FOLDER} ]
then
  echo "Hmm, the directory ${PWD}/${RM_PROJECT_FOLDER} already exists.  I'm going to exit and let you sort that out."
  exit 3
fi

# Check out repository
echo ""
echo "Cloning configuration: ${PWD}/${RM_PROJECT_FOLDER}"
git clone ${REPO} ${RM_PROJECT_FOLDER}
#mkdir -p ${RM_PROJECT_FOLDER}/conf
#cp ${RM_PROJECT_FOLDER}/conf.d/*.conf ${RM_PROJECT_FOLDER}/conf
echo ""