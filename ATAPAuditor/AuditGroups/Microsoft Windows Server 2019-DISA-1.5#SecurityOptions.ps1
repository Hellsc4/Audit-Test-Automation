﻿[AuditTest] @{
    Id = "V-93281"
    Task = "Windows Server 2019 built-in administrator account must be renamed."
    Test = {
        $securityOption = Get-AuditResource "WindowsSecurityOption"
        $setOption = $securityOption['System Access']["NewAdministratorName"]
        
        if ($null -eq $setOption) {
            return @{
                Message = "Currently not set."
                Status = "False"
            }
        }
        if ($setOption -notmatch "^(?!Administrator).*$") {
            return @{
                Message = "'NewAdministratorName' currently set to: $setOption. Expected: ^(?!Administrator).*$"
                Status = "False"
            }
        }
        
        return @{
            Message = "Compliant"
            Status = "True"
        }
    }
}
[AuditTest] @{
    Id = "V-93283"
    Task = "Windows Server 2019 built-in guest account must be renamed."
    Test = {
        $securityOption = Get-AuditResource "WindowsSecurityOption"
        $setOption = $securityOption['System Access']["NewGuestName"]
        
        if ($null -eq $setOption) {
            return @{
                Message = "Currently not set."
                Status = "False"
            }
        }
        if ($setOption -notmatch "^(?!Guest).*$") {
            return @{
                Message = "'NewGuestName' currently set to: $setOption. Expected: ^(?!Guest).*$"
                Status = "False"
            }
        }
        
        return @{
            Message = "Compliant"
            Status = "True"
        }
    }
}
[AuditTest] @{
    Id = "V-93289"
    Task = "Windows Server 2019 must not allow anonymous SID/Name translation."
    Test = {
        $securityOption = Get-AuditResource "WindowsSecurityOption"
        $setOption = $securityOption['System Access']["LSAAnonymousNameLookup"]
        
        if ($null -eq $setOption) {
            return @{
                Message = "Currently not set."
                Status = "False"
            }
        }
        if ($setOption -ne 0) {
            return @{
                Message = "'LSAAnonymousNameLookup' currently set to: $setOption. Expected: 0"
                Status = "False"
            }
        }
        
        return @{
            Message = "Compliant"
            Status = "True"
        }
    }
}
[AuditTest] @{
    Id = "V-93497"
    Task = "Windows Server 2019 must have the built-in guest account disabled."
    Test = {
        $securityOption = Get-AuditResource "WindowsSecurityOption"
        $setOption = $securityOption['System Access']["EnableGuestAccount"]
        
        if ($null -eq $setOption) {
            return @{
                Message = "Currently not set."
                Status = "False"
            }
        }
        if ($setOption -ne 0) {
            return @{
                Message = "'EnableGuestAccount' currently set to: $setOption. Expected: 0"
                Status = "False"
            }
        }
        
        return @{
            Message = "Compliant"
            Status = "True"
        }
    }
}
