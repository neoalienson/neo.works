---
title: How to login Cisco VPN automatically on macOS High Sierra
date: 2017-12-06 21:03:48
tags:
  - MacOS
category:
  - Misc
---

There is no way to save password when logging into Cisco IPSec VPN on macOS.

![No save password for security reason?](vpn_login.png)

The best solution to me is writing an Apple script in Automator to automate the login.

1. Open Apple's Script Editor,
![Automator](automator.png)

2. Choose `New Document`
![New Document](new_document.png)

3. Select `Service`
The service created has `receives selected` `text` by default. It means you need to select text or having focus in a text editor to enable the service.
![Serivce](service.png)

4. Try to search for action `Run AppleScript`. Then, drag the action into the right-hand-side.
![Search for action "Run AppleScript", and then drag it to the right-hand-side](run_apple_script.png)

5. Paste below code into the editor,

{% codeblock lang:applescript %}
on run {input, parameters}

  set vpn_name to "'your VPN name'"
  set user_name to "your username"
  set passwd to "your password"

	tell application "System Events"
		set rc to do shell script "scutil --nc status " & vpn_name
		if rc starts with "Disconnected" then
			do shell script "scutil --nc start " & vpn_name & " --user " & user_name
			delay 3
			keystroke passwd
			keystroke return
		end if
	end tell
	return input
end run
{% endcodeblock %}

![Editor with the script](script_editor.png)

6. Update `vpn_name`, `username` and `passwd` in the script.

You can take reference from below screenshot for the `vpn_name`, which is `VPN (Cisco IPSec)`. The script uses `scutil --nc status` to check the VPN connection status, and `scutil --nc start` to start the VPN connection. Usually the VPN login dialog shows within 3 seconds. If your laptop is slow please update value in `delay 3`. Try to run the script with the play button to see how it is automated.

![Your VPN name](vpn_name.png)

7. Save the script with a name such as `VPN Login`.
In the System Preferences->Keyboard->Shortcuts, you can see the automation script. Assign a shortcut key. The script is assigned to text service by default during the service creation. You will need to select text or having focus in a text editor to enable the keyboard shortcut.
![Assign hotkey for your VPN](keyboard_shortcuts.png)

8. Try to select text from an text editor such as Atom. With the proper shortcut key setup you should have the VPN login automated. It should works with Sierra or below but I haven't tested it. Please let me know your result in older macOS.

![Success!](success.png)
