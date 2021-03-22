# Getting the information back from the jobs
Get-Job | Receive-Job


$computers= import-csv .\server.csv
foreach ($computer in $computers){
    $running = @(Get-Job | Where-Object { $_.State -eq 'Running' })
    if ($running.Count -ge 4) {
        $running | Wait-Job -Any | Out-Null
    }
    $sername=$computer.ServerName
        Write-Host "Starting job for " $sername
        Start-Job {
            # do something with $using:server. Just sleeping for this example.
           Invoke-Command -ComputerName $using:sername -ScriptBlock {
           C:\Users\loadtest\Desktop\robot_for_performance_UI\6_scripts\test_order.bat
           }
        } | Out-Null
}
# Wait for all jobs to complete and results ready to be received
Wait-Job * | Out-Null

# Process the results
foreach($job in Get-Job)
{
    $result = Receive-Job $job
    Write-Host $result
}

Remove-Job -State Completed