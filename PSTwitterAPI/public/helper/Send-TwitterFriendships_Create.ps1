﻿function Send-TwitterFriendships_Create {
<#
.SYNOPSIS
    Follow, search, and get users

.DESCRIPTION
    POST friendships/create
    
    Allows the authenticating user to follow (friend) the user specified in the ID parameter.
    
    Returns the followed user when successful. Returns a string describing the failure condition when unsuccessful. If the user is already friends with the user a HTTP 403 may be returned, though for performance reasons this method may also return a HTTP 200 OK message even if the follow relationship already exists.
    
    Actions taken in this method are asynchronous. Changes will be eventually consistent.

.PARAMETER screen_name
    The screen name of the user to follow.

.PARAMETER user_id
    The ID of the user to follow.

.PARAMETER follow
    Enable notifications for the target user.

.NOTES
    This helper function was generated by the information provided here:
    https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/post-friendships-create

#>
    [CmdletBinding()]
    Param(
        [string]$screen_name,
        [string]$user_id,
        [string]$follow
    )
    Begin {

        [hashtable]$Parameters = $PSBoundParameters
                   $CmdletBindingParameters | ForEach-Object { $Parameters.Remove($_) }

        [string]$Method      = 'POST'
        [string]$Resource    = '/friendships/create'
        [string]$ResourceUrl = 'https://api.twitter.com/1.1/friendships/create.json'

    }
    Process {

        # Find & Replace any ResourceUrl parameters.
        $UrlParameters = [regex]::Matches($ResourceUrl, '(?<!\w):\w+')
        ForEach ($UrlParameter in $UrlParameters) {
            $UrlParameterValue = $Parameters["$($UrlParameter.Value.TrimStart(":"))"]
            $ResourceUrl = $ResourceUrl -Replace $UrlParameter.Value, $UrlParameterValue
        }

        $OAuthSettings = Get-TwitterOAuthSettings -Resource $Resource
        Invoke-TwitterAPI -Method $Method -ResourceUrl $ResourceUrl -Parameters $Parameters -OAuthSettings $OAuthSettings

    }
    End {

    }
}
