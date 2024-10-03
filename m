Return-Path: <selinux+bounces-2014-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3373498F9ED
	for <lists+selinux@lfdr.de>; Fri,  4 Oct 2024 00:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB615B21B4C
	for <lists+selinux@lfdr.de>; Thu,  3 Oct 2024 22:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4A61AC89A;
	Thu,  3 Oct 2024 22:34:19 +0000 (UTC)
X-Original-To: selinux@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379BF1C2459
	for <selinux@vger.kernel.org>; Thu,  3 Oct 2024 22:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727994859; cv=none; b=udsChDkVnDko7hZTU/aTk4UCZYEQ0xEJ6u3vaAqiyHMZQ3VmZwrlYQN7QiRXtGA3t5toTUCZWTe9nmeiTWsZOtD819gEcsQMoHJzE4fNrWTeGnD7WDq3zYJ6OU1aV1piBcekPR18O55nHEnevc20ABPRM76bjCZN8Myh9sxDFGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727994859; c=relaxed/simple;
	bh=9pOyjIY2Fu8sZWJ+h9Hhks0ngUMcydTiz+NvzoER/+Y=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vC7ijOJ7ZcazXcvZRIF0dQdIkQKKe6IDOVs647S5Rv1zdIai3snl9Q4P/ToRgWOhAoqlwi5aiS49kXmZlRIR5Y8GyQDdnU97D2JFH6Ys4Z1Xq/g1xCbx41oGO4XWsotc2CP1/MDGbUEZFXwlb51YOzRwiQkTJx4/s5MNyeEFJPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 6ccef329-81d7-11ef-995b-005056bd6ce9;
	Fri, 04 Oct 2024 01:32:55 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 4 Oct 2024 01:32:50 +0300
To: Daniel Gomez <da.gomez@samsung.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	William Hubbs <w.d.hubbs@gmail.com>,
	Chris Brannon <chris@the-brannons.com>,
	Kirk Reiser <kirk@reisers.ca>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	speakup@linux-speakup.org, selinux@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-serial@vger.kernel.org, llvm@lists.linux.dev,
	Finn Behrens <me@kloenk.dev>,
	"Daniel Gomez (Samsung)" <d+samsung@kruces.com>,
	gost.dev@samsung.com
Subject: Re: [PATCH v2 2/8] file2alias: fix uuid_t definitions for macos
Message-ID: <Zv8bkoJA5oDIe6If@surfacebook.localdomain>
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
 <20240906-macos-build-support-v2-2-06beff418848@samsung.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906-macos-build-support-v2-2-06beff418848@samsung.com>

Fri, Sep 06, 2024 at 01:01:29PM +0200, Daniel Gomez kirjoitti:
> The uuid_t struct defined in sys/types.h on macOS hosts conflicts with
> the one defined in file2alias, resulting in the typedef redefinition
> error below. To resolve this conflict, define the _UUID_T and
> __GETHOSTUUID_ in file2alias HOSTCFLAGS.
> 
> Error:
>   HOSTCC  scripts/mod/file2alias.o scripts/mod/file2alias.c:45:3:
> error: typedef redefinition with different types ('struct uuid_t' vs
> '__darwin_uuid_t' (aka 'unsigned char[16]'))    45 | } uuid_t;       |
> ^
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    sys/_types/_uuid_t.h:31:25: note: previous definition is here 31 |
>    typedef __darwin_uuid_t uuid_t;    |                         ^
> scripts/mod/file2alias.c:1354:7: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1354 |
>  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1354:19: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1354 |
>  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~

Please, shrink this to the valuable ~3-5 lines. No need to repeat the same for
each case!

-- 
With Best Regards,
Andy Shevchenko



