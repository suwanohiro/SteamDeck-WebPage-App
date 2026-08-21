const { app, BrowserWindow } = require("electron");

app.whenReady().then(() => {
    const win = new BrowserWindow({
        fullscreen: true,
        frame: false,
    });

    // 起動引数の最後を取得（指定がなければデフォルトのURL）
    const targetUrl = process.argv[process.argv.length - 1].startsWith("http")
        ? process.argv[process.argv.length - 1]
        : "https://google.com";

    win.loadURL(targetUrl);
});
