Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B158CD8321
	for <lists+selinux@lfdr.de>; Wed, 16 Oct 2019 00:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbfJOWCs (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 15 Oct 2019 18:02:48 -0400
Received: from mail-ua1-f48.google.com ([209.85.222.48]:43427 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbfJOWCs (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 15 Oct 2019 18:02:48 -0400
Received: by mail-ua1-f48.google.com with SMTP id k24so6590431uag.10
        for <selinux@vger.kernel.org>; Tue, 15 Oct 2019 15:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=FkXgkvBbEZcJoTld8F2jwOIZF+yNhVcYo2l9/8vpl9I=;
        b=EHDEifwP89xjhq2jw9JzWtbLRdyw6Q2hB+mgvtmpT3Y45fctzj/OFjL+xAxKi8OIoA
         vmmThmt3P1krEYtlzQILFpjyhroNFJVAteFGHf+dHcQfvFs6DypLlIpUtjN/n9DHCHQb
         hQUe5llY6wekVjWh0gPbzxooCFE4ZaX9DxRRAXt6PUbqxh1719xUBqmSDmsVFQL4fsk4
         GLnlT7gYNroXN5WkVcmkPV992mRKT3WpDr5piHRhocUU0UvqQbIDIVynguwu3EycEaFh
         4nP+7AiZHBevq5y570fkMkWQWwJWoqirMh/qYHLeCVLUZ33MuNpqmseQjWZT/8aDTz9A
         SjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=FkXgkvBbEZcJoTld8F2jwOIZF+yNhVcYo2l9/8vpl9I=;
        b=f/Kc4PgceTnUyhUBNg7tOAZ2k98u5vN884yukYRx/qconbUEdHqk6M3Rzyua6WTEKi
         uyY99MqrTa0RyhZ3JGp6kteMMTC3rCj5e4Lfw2PE+4JeS6ETla/wRjd69fxLky4dQa+/
         NjWYlC+Sy8hxlVC0GvqZZRJQSQs0OybeHW9DgOVMbXoviJP2pdLSEesAZ+3X3vkfK3FM
         TTMZZzLb0wx5jEcGuqbyjMMfr0HEk7e99WB/7/TSJu6yf2SIA6h4jMrgOfNAV5tfq5UZ
         O9HUnMysjbBTt0pLrlXqSsSvJ4Oh48fSX5VsZIowpg1DUiDVa2RHOgHh1WOIihA2WYuu
         U+5g==
X-Gm-Message-State: APjAAAUPv8dNOl4dg2pnkRBG40lMdF4s+9ki6qIFM9i4jVme45NTm+EZ
        5r11HhYFZ8yKESuqBNfdMCEXhB1x9FfKV5H5l9bRhuut
X-Google-Smtp-Source: APXvYqwMOK04xw3booyIsybd0zVKIAvQeS71o2nA7b4H0j79ns8wl2qsvlgkb55aQyXNostRHBPLMClKiJ79f1yJMEY=
X-Received: by 2002:ab0:331a:: with SMTP id r26mr14995098uao.104.1571176965306;
 Tue, 15 Oct 2019 15:02:45 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Date:   Wed, 16 Oct 2019 00:02:34 +0200
Message-ID: <CAJ2a_Dd=T1sQh5zCqJLf8XTSQVU6Qgz78aFpT2oQ30VYVbQnWw@mail.gmail.com>
Subject: shadow: migrate to new SELinux api
To:     selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hi,

I created a patch for shadow to migrate to the new SELinux api [1].
Any suggestions or comments are welcome.

Best regards
      Christian G=C3=B6ttsche


[1] https://github.com/shadow-maint/shadow/pull/183
