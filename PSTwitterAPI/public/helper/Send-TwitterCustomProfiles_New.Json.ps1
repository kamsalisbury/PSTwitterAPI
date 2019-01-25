﻿function Send-TwitterCustomProfiles_New.Json {
<#
.SYNOPSIS
    Custom profiles

.DESCRIPTION
    POST custom_profiles/new.json
    
    Creates a new custom profile. The returned ID should be used with when publishing a new message with POST direct_messages/events/new.

.PARAMETER name (required)
    

.PARAMETER avatar.media.id (required)
    

.NOTES
    This helper function was generated by the information provided here:
    https://developer.twitter.com/en/docs/direct-messages/custom-profiles/api-reference/new-profile

#>
    [CmdletBinding()]
    Param(
        [string]$name,
        [string]$avatar.media.id
    )
    Begin {

        [hashtable]$Parameters = $PSBoundParameters
                   $CmdletBindingParameters | ForEach-Object { $Parameters.Remove($_) }

        [string]$Method      = 'POST'
        [string]$Resource    = '/custom_profiles/new.json'
        [string]$ResourceUrl = 'https://api.twitter.com/1.1/custom_profiles/new.json'

    }
    Process {

        If (-Not $OAuthSettings) { $OAuthSettings = Get-TwitterOAuthSettings -Resource $Resource }
        Invoke-TwitterAPI -Method $Method -ResourceUrl $ResourceUrl -Resource $Resource -Parameters $Parameters -OAuthSettings $OAuthSettings

    }
    End {

    }
}