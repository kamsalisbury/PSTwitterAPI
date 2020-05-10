﻿function Get-TwitterLists_SubscribersShow {
<#
.SYNOPSIS
    Create and manage lists

.DESCRIPTION
    GET lists/subscribers/show
    
    Check if the specified user is a subscriber of the specified list. Returns the user if they are a subscriber.

.PARAMETER owner_screen_name
    The screen name of the user who owns the list being requested by a slug.

.PARAMETER owner_id
    The user ID of the user who owns the list being requested by a slug.

.PARAMETER list_id
    The numerical id of the list.

.PARAMETER slug
    You can identify a list by its slug instead of its numerical id. If you decide to do so, note that you'll also have to specify the list owner using the owner_id or owner_screen_name parameters.

.PARAMETER user_id
    The ID of the user for whom to return results. Helpful for disambiguating when a valid user ID is also a valid screen name.

.PARAMETER screen_name
    The screen name of the user for whom to return results. Helpful for disambiguating when a valid screen name is also a user ID.

.PARAMETER include_entities
    When set to either true, t or 1, each Tweet will include a node called "entities". This node offers a variety of metadata about the tweet in a discreet structure, including: user_mentions, urls, and hashtags. While entities are opt-in on timelines at present, they will be made a default component of output in the future. See Tweet Entities for more details.

.PARAMETER skip_status
    When set to either true , t or 1 statuses will not be included in the returned user objects.

.NOTES
    This helper function was generated by the information provided here:
    https://developer.twitter.com/en/docs/accounts-and-users/create-manage-lists/api-reference/get-lists-subscribers-show

#>
    [CmdletBinding()]
    Param(
        [string]$owner_screen_name,
        [string]$owner_id,
        [string]$list_id,
        [string]$slug,
        [string]$user_id,
        [string]$screen_name,
        [string]$include_entities,
        [string]$skip_status
    )
    Begin {

        [hashtable]$Parameters = $PSBoundParameters
                   $CmdletBindingParameters | ForEach-Object { $Parameters.Remove($_) }

        [string]$Method      = 'GET'
        [string]$Resource    = '/lists/subscribers/show'
        [string]$ResourceUrl = 'https://api.twitter.com/1.1/lists/subscribers/show.json'

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
