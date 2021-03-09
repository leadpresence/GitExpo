import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:gitexpo/single-card.dart';
import 'package:gitexpo/utils/styles.dart';

void main() {
  runApp(GitExpo());
}

class GitExpo extends StatelessWidget {
  const GitExpo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFF011627),
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white))),
      home: Expos(),
    );
  }
}

class Expos extends StatefulWidget {
  Expos({Key? key}) : super(key: key);

  @override
  _ExposState createState() => _ExposState();
}

class _ExposState extends State<Expos> {
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "GitExpo",
            style: Styles.appBarTitleText,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              child: ListView.builder(
                  itemCount: commands.length,
                  itemBuilder: (context, index) {
                    return 
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: AnimatedSwitcher(duration: Duration(microseconds: 600),
                      child: Singlecard(command: commands[index])),
                    );
                  })),
        ));
  }

  List<Command> commands = [
    Command(content: "git init", title: "How to initialize a Git repo", subtitle: "Everything starts from here. The first step is to initialize a new Git repo locally in your project root. You can do so with the command below"),

    Command(content: "git config -l", title: "How to check your Git configuration", subtitle: "The command below returns a list of information about your git configuration including user name and email"),
    Command(content: "git config --global user.name 'Fabio'", title: "How to setup your Git username:", subtitle: "With the command below you can configure your user name"),

    Command(content: "git config --global user.email 'mobiledev@chibuezefelix.com'", title: "How to setup your Git user email", subtitle: "This command lets you setup the user email address you'll use in your commits"),

    Command(content: "git config --global credential.helper cache", title: "How to cache your login credentials in Git", subtitle: "You can store login credentials in the cache so you don't have to type them in each time. Just use this command"),

    Command(content:"git add filename_here" , title: "How to add file to git", subtitle: "The command below will add a file to the staging area. Just replace filename_here with the name of the file you want to add to the staging area."),

    Command(content:"git add ." , title: "How to add all files in the staging area in Git", subtitle: "If you want to add all files in your project to the staging area, you can use a wildcard . and every file will be added for you."),

    Command(content:"git add fil*" , title: "How to add only certain files to the staging area in Git", subtitle: "With the asterisk in the command below, you can add all files starting with 'fil' in the staging area."),

    Command(content: "git status", title: "How to check a repository's status in Git:", subtitle: "This command will show the status of the current repository including staged, unstaged, and untracked files."),

    Command(content:"git commit" , title: "How to commit changes in the editor in Git:", subtitle: "This command will open a text editor in the terminal where you can write a full commit message.A commit message is made up of a short summary of changes, an empty line, and a full description of the changes after it."),

    Command(content:"git commit -m 'your commit message here'" , title: "How to commit changes with a message in Git:", subtitle: "You can add a commit message without opening the editor. This command lets you only specify a short summary for your commit message."),

    Command(content: "git commit -a -m 'your commit message here'", title: "How to commit changes (and skip the staging area) in Git:", subtitle: "You can add and commit tracked files with a single command by using the -a and -m options."),

    Command(content: "git log", title: "How to see your commit history in Git:", subtitle: "This command shows the commit history for the current repository"),

    Command(content:"git log -p" , title: "How to see your commit history including changes in Git:", subtitle: "This command shows the commit's history including all files and their changes:"),

    Command(content:"git show commit-id" , title: "How to see a specific commit in Git:", subtitle: "This command shows a specific commit.Replace commit-id with the id of the commit that you find in the commit log after the word commit."),

    Command(content:"git log --stat" , title: "How to see log stats in Git:", subtitle: "This command will cause the Git log to show some statistics about the changes in each commit, including line(s) changed and file names."),

    Command(content:"git diff \n git diff all_checks.py \n git diff --staged" , title: "How to see changes made before committing them using 'diff' in Git:", subtitle: "You can pass a file as a parameter to only see changes on a specific file. git diff shows only unstaged changes by default.We can call diff with the --staged flag to see any staged changes."),

    Command(content: "git add -p", title: "How to see changes using git add -p", subtitle: "This command opens a prompt and asks if you want to stage changes or not, and includes other options."),

    Command(content: "git rm filename", title: "How to remove tracked files from the current working tree in Git:",subtitle: "This command expects a commit message to explain why the file was deleted." ),

    Command(content: "git mv oldfile newfile", title: "How to rename files in Git:", subtitle: "This command stages the changes, then it expects a commit message."),

    Command(content:"Create a .gitigore file and commit it." , title: "How to ignore files in Git:", subtitle: "In your app directory"),

    Command(content:"git checkout filename" , title: "How to revert unstaged changes in Git:", subtitle: ""),

    Command(content:"git reset HEAD filename \n git reset HEAD -p" , title: "How to revert staged changes in Git", subtitle: "You can use the -p option flag to specify the changes you want to reset."),

    Command(content:"git commit --amend allows you to modify and add changes to the most recent commit. \n git commit --amend" , title: "How to amend the most recent commit in Git", subtitle: " fixing up a local commit with amend is great and you can push it to a shared repository after you've fixed it. But you should avoid amending commits that have already been made public."),
    
    Command(content: "git revert HEAD", title: "How to rollback the last commit in Git", subtitle: "git revert will create a new commit that is the opposite of everything in the given commit.We can revert the latest commit by using the head alias like this:"),
    Command(content: "git revert comit_id_here", title: "How to rollback an old commit in Git:", subtitle: "You can revert an old commit using its commit id. This opens the editor so you can add a commit message."),

    Command(content: "git branch branch_name", title: "How to create a new branch in Git", subtitle: "By default, you have one branch, the main branch. With this command, you can create a new branch. Git won't switch to it automatically – you will need to do it manually with the next command."),

    Command(content: "git checkout branch_name", title: "How to switch to a newly created branch in Git:", subtitle: "When you want to use a different or a newly created branch you can use this command:"),

    Command(content: "git branch", title: "How to list branches in Git", subtitle: "You can view all created branches using the git branch command. It will show a list of all branches and mark the current branch with an asterisk and highlight it in green."),

    Command(content: "git checkout -b branch_name", title: "How to create a branch in Git and switch to it immediately:", subtitle: "In a single command, you can create and switch to a new branch right away."),

    Command(content: "git branch -d branch_name", title: "How to delete a branch in Git", subtitle: "When you are done working with a branch and have merged it, you can delete it using the command below:"),

    Command(content: "git merge branch_name", title: "How to merge two branches in Git:", subtitle: "To merge the history of the branch you are currently in with the branch_name, you will need to use the command below:"),

    Command(content: "git merge branch_name", title: "How to merge two branches in Git:", subtitle: "To merge the history of the branch you are currently in with the branch_name, you will need to use the command below"),

    Command(content: "git log --graph --oneline", title: "How to show the commit log as a graph in Git:", subtitle: "We can use --graph to get the commit log to show as a graph. Also,--oneline will limit commit messages to a single line."),
    Command(content: "git log --graph --online --all", title: "How to show the commit log as a graph of all branches in Git:", subtitle: "Does the same as the command above, but for all branches."),

    Command(content: "git merge --abort", title: "How to abort a conflicting merge in Git:", subtitle: "If you want to throw a merge away and start over, you can run the following command:"),

    Command(content: "git add remote https://repo_here", title: "How to add a remote repository in Git", subtitle: "This command adds a remote repository to your local repository (just replace https://repo_here with your remote repo URL)."),

    Command(content: "git remote -v", title: "How to see remote URLs in Git", subtitle: "You can see all remote repositories for your local repository with this command:"),

    Command(content: "git remote show origin", title: "How to get more info about a remote repo in Git:", subtitle: "Just replace origin with the name of the remote obtained by running the git remote -v command."),

    Command(content: "git push", title: "How to push changes to a remote repo in Git", subtitle: "When all your work is ready to be saved on a remote repository, you can push all changes using the command below:"),

    Command(content: "git pull", title: "How to pull changes from a remote repo in Git", subtitle: "If other team members are working on your repository, you can retrieve the latest changes made to the remote repository with the command below:"),

    Command(content: "git branch -r", title: "How to check remote branches that Git is tracking", subtitle: "This command shows the name of all remote branches that Git is tracking for the current repository"),

    Command(content: "git fetch", title: "How to fetch remote repo changes in Git", subtitle: "This command will download the changes from a remote repo but will not perform a merge on your local branch (as git pull does that instead)."),
    Command(content: "git log origin/main", title: "How to check the current commits log of a remote repo in Git", subtitle: "Commit after commit, Git builds up a log. You can find out the remote repository log by using this command:"),
    Command(content: "git merge origin/main", title: "How to merge a remote repo with your local repo in Git", subtitle: "If the remote repository has changes you want to merge with your local, then this command will do that for you"),

    Command(content: "git remote update", title: "How to get the contents of remote branches in Git without automatically merging", subtitle: "This lets you update the remote without merging any content into the local branches. You can call git merge or git checkout to do the merge."),

    Command(content: "git push --delete origin branch_name_here", title: "How to push a new branch to a remote repo in Git", subtitle: "If you want to push a branch to a remote repository you can use the command below. Just remember to add -u to create the branch upstream:"),

    Command(content: "git rebase branch_name_here", title: "How to use Git rebase:", subtitle: "You can transfer completed work from one branch to another using git rebase."),

    Command(content: "git rebase -i master \n # p, pick = use commit \n # r, reword = use commit, but edit the commit message \n # e, edit = use commit, but stop for amending \n # s, squash = use commit, but meld into previous commit \n # f, fixup = like 'squash', but discard this commit's log message \n # x, exec = run command (the rest of the line) using shell \n # d, drop = remove commit", title: "How to run rebase interactively in Git", subtitle: "You can run git rebase interactively using the -i flag.It will open the editor and present a set of commands you can use."),

    Command(content: "git push -f", title: "How to force a push request in Git", subtitle: "This command will force a push request. This is usually fine for pull request branches because nobody else should have cloned them.But this isn't something that you want to do with public repos."),





  ];
}
