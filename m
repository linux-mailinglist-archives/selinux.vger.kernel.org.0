Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 332EE513963
	for <lists+selinux@lfdr.de>; Thu, 28 Apr 2022 18:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236129AbiD1QLQ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 28 Apr 2022 12:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232927AbiD1QLQ (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 28 Apr 2022 12:11:16 -0400
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5A7A85BE43
        for <selinux@vger.kernel.org>; Thu, 28 Apr 2022 09:08:01 -0700 (PDT)
Received: from [192.168.1.10] (pool-173-66-191-184.washdc.fios.verizon.net [173.66.191.184])
        by linux.microsoft.com (Postfix) with ESMTPSA id 9873A20E99B0;
        Thu, 28 Apr 2022 09:08:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9873A20E99B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1651162081;
        bh=IiJzQKnIEfLvkQDF1rKQWdLJxzCzqEvBILvcCKcRw0E=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=a0usU0rfUOCt12C1gDHO4rZqEk/2R+C557ipuyOj/LuVeJJ1nNzPzsmXxVl82FQdE
         sn/fyFioPiGKO5sz5CW+LsUN/3to2ju2OoAVXlkKg9pYCF+Wibknp/HtjLZqBwVu4y
         iFXGnhySuA+fr2I6FDsqScWzW6lg8hAqYGZtVuS8=
Message-ID: <45e6ae63-efef-5ee8-6238-81476e250965@linux.microsoft.com>
Date:   Thu, 28 Apr 2022 12:07:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH for-3.5 3/5] setfiles: remove useless "iamrestorecon"
 checks in option parsing
Content-Language: en-US
To:     Laszlo Ersek <lersek@redhat.com>,
        SELinux List <selinux@vger.kernel.org>
Cc:     "Richard W.M. Jones" <rjones@redhat.com>,
        Petr Lautrbach <plautrba@redhat.com>
References: <20220428065354.27605-1-lersek@redhat.com>
 <20220428065354.27605-4-lersek@redhat.com>
From:   Daniel Burgener <dburgener@linux.microsoft.com>
In-Reply-To: <20220428065354.27605-4-lersek@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-19.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 4/28/2022 2:53 AM, Laszlo Ersek wrote:
> Commit 219eea83cea9 ("policycoreutils: setfiles/restorecon: fix -r/-R
> option", 2015-04-16) split the option strings between "setfiles" and
> "restorecon". Since that commit, an "iamrestorecon" check has only been
> necessary for an option that is (a) accepted by both "setfiles" and
> "restorecon", but (b) behaves differently between "setfiles" and
> "restorecon". Currently, the only such options are "-r" and "-R". Remove
> the "iamrestorecon" checks from the "setfiles"-only "-c" and "-d" options,
> and from the "restorecon"-only "-x" option.
> 
> Cc: "Richard W.M. Jones" <rjones@redhat.com>
> Cc: Petr Lautrbach <plautrba@redhat.com>
> Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1794518
> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> ---
>   policycoreutils/setfiles/setfiles.c | 11 +----------
>   1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/policycoreutils/setfiles/setfiles.c b/policycoreutils/setfiles/setfiles.c
> index cf504618d38f..aeec1fdcc2ab 100644
> --- a/policycoreutils/setfiles/setfiles.c
> +++ b/policycoreutils/setfiles/setfiles.c
> @@ -227,9 +227,6 @@ int main(int argc, char **argv)
>   			{
>   				FILE *policystream;
>   
> -				if (iamrestorecon)
> -					usage(argv[0]);
> -
>   				policyfile = optarg;
>   
>   				policystream = fopen(policyfile, "r");
> @@ -267,8 +264,6 @@ int main(int argc, char **argv)
>   			input_filename = optarg;
>   			break;
>   		case 'd':
> -			if (iamrestorecon)
> -				usage(argv[0]);
>   			r_opts.debug = 1;
>   			r_opts.log_matches =
>   					   SELINUX_RESTORECON_LOG_MATCHES;
> @@ -367,11 +362,7 @@ int main(int argc, char **argv)
>   			null_terminated = 1;
>   			break;
>   		case 'x':
> -			if (iamrestorecon) {
> -				r_opts.xdev = SELINUX_RESTORECON_XDEV;
> -			} else {
> -				usage(argv[0]);
> -			}
> +			r_opts.xdev = SELINUX_RESTORECON_XDEV;
>   			break;
>   		case 'T':
>   			nthreads = strtoull(optarg, &endptr, 10);

Reviewed-By: Daniel Burgener <dburgener@linux.microsoft.com>
