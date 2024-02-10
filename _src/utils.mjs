const print = function (txt = "", color = "white") {
  console.log(chalk[color].bold("  " + txt));
};

const printLine = function (color = "white") {
  console.log(
    chalk[color].bold("================================================"),
  );
};

const printHeader = function (txt, color = "white") {
  printLine(color);
  print(txt, color);
  printLine(color);
};

const createLink = async function (sourcePath, targetPath) {
  if (fs.pathExists(targetPath)) {
    print(`${targetPath} already exists`, "red");
  }

  // await $`ln -sf ${sourcePath} ${targetPath}`;
};

export { print, printLine, printHeader, createLink };
