Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FED42FCA56
	for <lists+selinux@lfdr.de>; Wed, 20 Jan 2021 06:12:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbhATFKL (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 20 Jan 2021 00:10:11 -0500
Received: from namei.org ([65.99.196.166]:50812 "EHLO mail.namei.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729291AbhATFCm (ORCPT <rfc822;selinux@vger.kernel.org>);
        Wed, 20 Jan 2021 00:02:42 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.namei.org (Postfix) with ESMTPS id 964A8751;
        Wed, 20 Jan 2021 05:01:13 +0000 (UTC)
Date:   Wed, 20 Jan 2021 16:01:13 +1100 (AEDT)
From:   James Morris <jmorris@namei.org>
To:     Suren Baghdasaryan <surenb@google.com>
cc:     Andrew Morton <akpm@linux-foundation.org>, jannh@google.com,
        Kees Cook <keescook@chromium.org>, jeffv@google.com,
        minchan@kernel.org, mhocko@suse.com, shakeelb@google.com,
        rientjes@google.com, edgararriaga@google.com, timmurray@google.com,
        linux-mm@kvack.org, selinux@vger.kernel.org,
        linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com, linux-security-module@vger.kernel.org
Subject: Re: [PATCH v2 1/1] mm/madvise: replace ptrace attach requirement
 for process_madvise
In-Reply-To: <20210111170622.2613577-1-surenb@google.com>
Message-ID: <c586aa93-52d7-bd6c-3d5-77be4ed4afae@namei.org>
References: <20210111170622.2613577-1-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Mon, 11 Jan 2021, Suren Baghdasaryan wrote:

> Replace PTRACE_MODE_ATTACH with a combination of PTRACE_MODE_READ
> and CAP_SYS_NICE. PTRACE_MODE_READ to prevent leaking ASLR metadata
> and CAP_SYS_NICE for influencing process performance.


Almost missed these -- please cc the LSM mailing list when modifying 
capabilities or other LSM-related things.

-- 
James Morris
<jmorris@namei.org>

