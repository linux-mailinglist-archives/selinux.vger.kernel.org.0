Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9020069FD2D
	for <lists+selinux@lfdr.de>; Wed, 22 Feb 2023 21:47:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231268AbjBVUr4 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 22 Feb 2023 15:47:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232725AbjBVUrz (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 22 Feb 2023 15:47:55 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 3940340DF
        for <selinux@vger.kernel.org>; Wed, 22 Feb 2023 12:47:53 -0800 (PST)
Received: (qmail 1219888 invoked by uid 1000); 22 Feb 2023 15:47:52 -0500
Date:   Wed, 22 Feb 2023 15:47:52 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     selinux@vger.kernel.org
Cc:     Dominick Grift <dac.override@gmail.com>
Subject: What's wrong with this usage of semanage fcontext?
Message-ID: <Y/Z/eJU/yEseH2Jk@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

To anyone who can provide some advice: I'd like to know what's going 
wrong here.

------------------------------------------------------------
# semanage fcontext -a -e /home '/mnt/export/share./home'
# semanage fcontext -l -C
...
SELinux Local fcontext Equivalence 

/mnt/export/share./home = /home
# restorecon -v -r /mnt/export/share4/home
Warning no default label for /mnt/export/share4/home
------------------------------------------------------------

Shouldn't /mnt/export/share4/home match the PCRE '/mnt/export/share./home'?
Why does restorecon say there's no default label?

Alan Stern
