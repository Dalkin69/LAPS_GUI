# LAPS GUI

A tiny PowerShell script that provides a minimal graphical interface to retrieve a computer's local administrator password managed by **Windows LAPS**.

## How it works

1. A dialog box prompts for the computer name.
2. The script queries Active Directory using `Get-LapsADPassword`.
3. The password is displayed in a text field, ready to be selected and copied (Ctrl+C).
4. If something goes wrong (computer not found, insufficient permissions, etc.), an error message is shown.

## Requirements

- A **domain-joined** Windows machine.
- The **Windows LAPS** PowerShell module, built into Windows 10/11 and Windows Server 2019+ (updated since April 2023). The legacy *Microsoft LAPS* module (`AdmPwd.PS`) is **not** used.
- Permission to read the LAPS password on the computer object in Active Directory (plus decryption rights if password encryption is enabled).

## Usage

Run the script while bypassing the execution policy for this session only:

```powershell
powershell.exe -ExecutionPolicy Bypass -File .\laps_gui.ps1
```

Or unblock the file once after downloading it:

```powershell
Unblock-File .\laps_gui.ps1
```

> **Note:** Scripts downloaded from the internet are blocked by default, since the script is not signed. A Group Policy enforcing a specific execution policy may take precedence over these options.

To hide the background console window when launching from a shortcut, add `-WindowStyle Hidden`:

```powershell
powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -File .\laps_gui.ps1
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
