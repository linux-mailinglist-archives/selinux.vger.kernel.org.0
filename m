Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14FB32960B0
	for <lists+selinux@lfdr.de>; Thu, 22 Oct 2020 16:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2900675AbgJVOJZ (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 22 Oct 2020 10:09:25 -0400
Received: from mailomta18-re.btinternet.com ([213.120.69.111]:57622 "EHLO
        re-prd-fep-043.btinternet.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2900581AbgJVOJZ (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 22 Oct 2020 10:09:25 -0400
Received: from re-prd-rgout-005.btmx-prd.synchronoss.net ([10.2.54.8])
          by re-prd-fep-043.btinternet.com with ESMTP
          id <20201022140922.DTKU30383.re-prd-fep-043.btinternet.com@re-prd-rgout-005.btmx-prd.synchronoss.net>;
          Thu, 22 Oct 2020 15:09:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=btinternet.com; s=btmx201904; t=1603375762; 
        bh=ItiAALsSNbyCiDt4MJhbAP8811U5i2i9fFvDd5zSUqM=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:MIME-Version;
        b=PE4PtpnDVTvfFYoHG0c0r58dI26kNyGKT5i38KB5zLoehOTCMXeGwrde5IQ7u1eBoGRKgyMJwSStSdZVbP4Ivmk3oQBXsr3ev+YRVCU7f83zKW72idQ+U8jjocb/aDB10tagDwEH5H/PcKyrV+K9lbBnY2oPhmppYpTmyd9V/EWCgfcH7TuRmohPssEUf2gVH3bGcNnMsDnAjd+M74cHn6ZbJsmy40YghHOqHIaMnAw9OkyQTa+ukT+an5azIZBa5KkeZ/x1GdAFgbgqQdtV7nJj/io2m0k8SDShkZ9jdo+PQ67M48RjfZs07qjCOVKAFfULCHWdB35FDzyBtP1u3A==
Authentication-Results: btinternet.com;
    auth=pass (LOGIN) smtp.auth=richard_c_haines@btinternet.com
X-SNCR-Rigid: 5ED9C74D1705C395
X-Originating-IP: [109.158.127.77]
X-OWM-Source-IP: 109.158.127.77 (GB)
X-OWM-Env-Sender: richard_c_haines@btinternet.com
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedujedrjeejgdejudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceutffkvffkuffjvffgnffgvefqofdpqfgfvfenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomheptfhitghhrghrugcujfgrihhnvghsuceorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomheqnecuggftrfgrthhtvghrnhepkeegfedtffekieekudegvdekjeehieffveevleegtdeludetveduleffudfggfeinecukfhppedutdelrdduheekrdduvdejrdejjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhinhgvthepuddtledrudehkedruddvjedrjeejpdhmrghilhhfrhhomhepoehrihgthhgrrhgupggtpghhrghinhgvshessghtihhnthgvrhhnvghtrdgtohhmqecuuefqffgjpeekuefkvffokffogfdprhgtphhtthhopeeoohhmohhsnhgrtggvsehrvgguhhgrthdrtghomheqpdhrtghpthhtohepoehsvghlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgqe
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-SNCR-hdrdom: btinternet.com
Received: from localhost.localdomain (109.158.127.77) by re-prd-rgout-005.btmx-prd.synchronoss.net (5.8.340) (authenticated as richard_c_haines@btinternet.com)
        id 5ED9C74D1705C395; Thu, 22 Oct 2020 15:09:22 +0100
Message-ID: <61c2a3843a7fbf06d5a1978506713c57662f4402.camel@btinternet.com>
Subject: Re: [PATCH 1/2] tests/sctp: fix a race condition in the new ASCONF
 test
From:   Richard Haines <richard_c_haines@btinternet.com>
To:     Ondrej Mosnacek <omosnace@redhat.com>, selinux@vger.kernel.org
Date:   Thu, 22 Oct 2020 15:09:13 +0100
In-Reply-To: <20201021214453.400811-2-omosnace@redhat.com>
References: <20201021214453.400811-1-omosnace@redhat.com>
         <20201021214453.400811-2-omosnace@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, 2020-10-21 at 23:44 +0200, Ondrej Mosnacek wrote:
> The new ASCONF test introduced recently (see Fixes: tag) is unstable
> and
> can randomly fail on slow machines. The problem seems to be triggered
> when the server does the sctp_bindx() calls before the client starts
> listening for a new message, so add a 1 second sleep before the bindx
> calls.
> 
> It is possible that this delay will not be enough on some very slow
> machines, but let's start with a small value and see how it goes. The
> one second seems to be enough for the Travis CI at least.
> 
> Fixes: 841ccaabb366 ("selinux-testsuite: Update SCTP asconf
> client/server")
> Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
> ---
>  tests/sctp/sctp_asconf_params_server.c | 7 +++++++
>  1 file changed, 7 insertions(+)

Tested the three asconf tests over 1000 interations with no problems.
In the meantime I'll review these tests to find a more reliable way to
run them.

Acked-by: Richard Haines <richard_c_haines@btinternet.com>
> 
> diff --git a/tests/sctp/sctp_asconf_params_server.c
> b/tests/sctp/sctp_asconf_params_server.c
> index 18e2cb2..ded782e 100644
> --- a/tests/sctp/sctp_asconf_params_server.c
> +++ b/tests/sctp/sctp_asconf_params_server.c
> @@ -225,6 +225,13 @@ int main(int argc, char **argv)
>  		       ((struct sockaddr_in6 *)
>  			new_pri_addr_res->ai_addr)->sin6_scope_id);
>  
> +	/*
> +	 * We can't do the sctp_bindx() calls too fast, otherwise the
> test
> +	 * that checks if these are denied would fail. Therefore, sleep
> for
> +	 * a bit to allow the client to catch up.
> +	 */
> +	sleep(1);
> +
>  	/*
>  	 * Now call sctp_bindx(3) to add 'new_pri_addr'. This uses
> Dynamic
>  	 * Address Reconfiguration by sending an asconf chunk with

