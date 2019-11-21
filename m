Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFA2E105804
	for <lists+selinux@lfdr.de>; Thu, 21 Nov 2019 18:08:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfKURIe (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 21 Nov 2019 12:08:34 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40846 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbfKURIe (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 21 Nov 2019 12:08:34 -0500
Received: by mail-oi1-f195.google.com with SMTP id d22so3854894oic.7
        for <selinux@vger.kernel.org>; Thu, 21 Nov 2019 09:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joshuainnovates-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=s3F245JNSxnOZ79JPBdTpdYnJaZAb/zkgSsy1iPvPkI=;
        b=aGPgHahkX4HFsviUYYiy84llA8DaBt9V3R9qkl7wUvfCkIE9KQhehdPYAYLDYaciM2
         oPqqoSUvpgXdkx5nZ2EMvJ6pi5wHCSxv9yBgG+6m2X/8FmSh9cOshC1oTndwf8AiQo5t
         umIHlsFeFN1BvyHirixv7Rr6a0q55Foj+tlo2Yn2ng/KBSWW8MmljWQwzWNSJ+/vKnWJ
         WDeL8sYAekOQIgBPsqCUZnGoYIMmiHxus/+SjfPKdM9LZV/5AU4AcOAZjYQmYgaXwt98
         1Y0f1gG85tZhOSAyHJ7ypd3Zpmt5a7bTNBVNFVKju40fIfS2iWArcLkXoHMyRyT7zw7f
         FMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=s3F245JNSxnOZ79JPBdTpdYnJaZAb/zkgSsy1iPvPkI=;
        b=jCMvny+suyvyBL+IFu7yOwExbJxuScFgE2VVQ8lpTP3olA6iUZB8LiB7NI0cZ9u59a
         pShfyu4LgE2JfqvtoZinkjzE+NvYBoQuw0EWdvlXKxxe/0Ji+DqRqf3wFIjPBqYG30a5
         i3GLycXl9oO8C2WaP4ABhZpQVY5sjX2YDjrO+R3kj7HyHg/3I9AqlFUiW3xB8xO4Q5is
         K5+RYt4gTUoDC2PhM+vmNqMllCHECetaudyI9ypC8HScFrMcQUZ9u8xcc3BL569wTjve
         UBh3rRNUAquREofINYhJRtEUL5ZF6aEFoALZ4FRzjLjfwxOskvqAnXE1+kl8GNJGNafp
         cQMQ==
X-Gm-Message-State: APjAAAUGyuMrTlMLhfsoixB55+9N74nLvzaH+GbPS4asRabK4/skBgBY
        IekA8MEAZsyX6mayCM0l6H651WFXl32QVBU0jsmjYHhwmnE=
X-Google-Smtp-Source: APXvYqzbzWFJ2tQFTr1n4TRRT/07CID0zwpVV5RN/C9VDeX4HyS3GLP+BrfGWiU96lyCu9hkJrOTsdTbIOJBHznoiRM=
X-Received: by 2002:a05:6808:9a1:: with SMTP id e1mr8710087oig.175.1574356112181;
 Thu, 21 Nov 2019 09:08:32 -0800 (PST)
MIME-Version: 1.0
From:   Joshua Schmidlkofer <joshua@joshuainnovates.us>
Date:   Thu, 21 Nov 2019 09:08:17 -0800
Message-ID: <CAOCpKq=dzcbN5+kc1WJBQKHa=EEwC5hO+=ZasLXtbuC7T-Jc-g@mail.gmail.com>
Subject: 
To:     selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

subscribe selinux
