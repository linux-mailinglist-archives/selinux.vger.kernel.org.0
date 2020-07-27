Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB79822FA3B
	for <lists+selinux@lfdr.de>; Mon, 27 Jul 2020 22:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbgG0UkY (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 27 Jul 2020 16:40:24 -0400
Received: from namei.org ([65.99.196.166]:55746 "EHLO namei.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726091AbgG0UkY (ORCPT <rfc822;selinux@vger.kernel.org>);
        Mon, 27 Jul 2020 16:40:24 -0400
Received: from localhost (localhost [127.0.0.1])
        by namei.org (8.14.4/8.14.4) with ESMTP id 06RKeAC6028381;
        Mon, 27 Jul 2020 20:40:10 GMT
Date:   Tue, 28 Jul 2020 06:40:10 +1000 (AEST)
From:   James Morris <jmorris@namei.org>
To:     Casey Schaufler <casey@schaufler-ca.com>,
        Paul Moore <paul@paul-moore.com>
cc:     casey.schaufler@intel.com, linux-security-module@vger.kernel.org,
        selinux@vger.kernel.org, Audit-ML <linux-audit@redhat.com>,
        Kees Cook <keescook@chromium.org>,
        John Johansen <john.johansen@canonical.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Stephen Smalley <sds@tycho.nsa.gov>
Subject: Re: [PATCH v19 21/23] Audit: Add a new record for multiple object
 LSM  attributes
In-Reply-To: <20200724203226.16374-22-casey@schaufler-ca.com>
Message-ID: <alpine.LRH.2.21.2007280639100.18670@namei.org>
References: <20200724203226.16374-1-casey@schaufler-ca.com> <20200724203226.16374-22-casey@schaufler-ca.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Fri, 24 Jul 2020, Casey Schaufler wrote:

> Create a new audit record type to contain the object information
> when there are multiple security modules that require such data.
> This record is emitted before the other records for the event, but
> is linked with the same timestamp and serial number.
> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> Cc: linux-audit@redhat.com

These audit patches will need ack/review from Paul.

-- 
James Morris
<jmorris@namei.org>

