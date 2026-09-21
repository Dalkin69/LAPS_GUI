Add-Type -AssemblyName Microsoft.VisualBasic
Add-Type -AssemblyName System.Windows.Forms

$computer = [Microsoft.VisualBasic.Interaction]::InputBox("Nom de la machine :", "LAPS - Recuperation MDP")

if ($computer) {
    try {
        $result = Get-LapsADPassword -Identity $computer -AsPlainText
        [Microsoft.VisualBasic.Interaction]::InputBox("Mot de passe pour $computer (selectionne et Ctrl+C) :", "LAPS - $computer", $result.Password)
    } catch {
        [System.Windows.Forms.MessageBox]::Show("Erreur : $_", "LAPS - Erreur")
    }
}