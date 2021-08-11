<#
.LINK
https://www.alitajran.com/cumulative-update-21-for-exchange-server-2016/
#>

# Source: Ali Tarjan - https://www.alitajran.com/cumulative-update-21-for-exchange-server-2016/

# How to temporarily disable AMSI if you see some slowdowns after applying CU21 

# Run Exchange Management Shell and run these three commands to create a new server override:
New-SettingOverride -Name “DisablingAMSIScan” -Component Cafe -Section HttpRequestFiltering -Parameters (“Enabled=False”) -Reason “Testing”
Get-ExchangeDiagnosticInfo -Process Microsoft.Exchange.Directory.TopologyService -Component VariantConfiguration -Argument Refresh
Restart-Service -Name W3SVC, WAS -Force

# Check if the server performance is back to normal (CPU, RAM, MAPIHTTP counters,...)

# Run Exchange Management Shell and run these three commands to remove the setting override:
Remove-SettingOverride -Name “DisablingAMSIScan” -Component Cafe -Section HttpRequestFiltering -Parameters (“Enabled=False”) -Reason “Testing”
Get-ExchangeDiagnosticInfo -Process Microsoft.Exchange.Directory.TopologyService -Component VariantConfiguration -Argument Refresh
Restart-Service -Name W3SVC, WAS -Force


