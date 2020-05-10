﻿function Send-TwitterAccount_UpdateProfileBackgroundImage {
<#
.SYNOPSIS
    Manage account settings and profile

.DESCRIPTION
    POST account/update_profile_background_image (deprecated)
    
    Updates the authenticating user's profile background image. This method can also be used to enable or disable the profile background image.
    
    Although each parameter is marked as optional, at least one of image or media_id must be provided when making this request.
    
    Learn more about the deprecation of this endpoint via our forum post.

.PARAMETER image
    The background image for the profile, base64-encoded. Must be a valid GIF, JPG, or PNG image of less than 800 kilobytes in size. Images with width larger than 2048 pixels will be forcibly scaled down. The image must be provided as raw multipart data, not a URL.

.PARAMETER tile
    Whether or not to tile the background image. If set to true , t or 1 the background image will be displayed tiled. The image will not be tiled otherwise.

.PARAMETER include_entities
    The entities node will not be included when set to false .

.PARAMETER skip_status
    When set to either true , t or 1 statuses will not be included in the returned user objects.

.PARAMETER media_id
    Specify the media to use as the background image. More information on upload of media is available here .

.NOTES
    This helper function was generated by the information provided here:
    https://developer.twitter.com/en/docs/accounts-and-users/manage-account-settings/api-reference/post-account-update_profile_background_image

#>
    [CmdletBinding()]
    Param(
        [string]$image,
        [string]$tile,
        [string]$include_entities,
        [string]$skip_status,
        [string]$media_id
    )
    Begin {

        [hashtable]$Parameters = $PSBoundParameters
                   $CmdletBindingParameters | ForEach-Object { $Parameters.Remove($_) }

        [string]$Method      = 'POST'
        [string]$Resource    = '/account/update_profile_background_image'
        [string]$ResourceUrl = 'https://api.twitter.com/1.1/account/update_profile_background_image.json'

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
