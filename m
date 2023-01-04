Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1D4D65D3F4
	for <lists+selinux@lfdr.de>; Wed,  4 Jan 2023 14:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbjADNPi (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 4 Jan 2023 08:15:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239426AbjADNPQ (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 4 Jan 2023 08:15:16 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE12E1EC5E
        for <selinux@vger.kernel.org>; Wed,  4 Jan 2023 05:15:15 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id w3so4192707ply.3
        for <selinux@vger.kernel.org>; Wed, 04 Jan 2023 05:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2m/uNsCm/OsAUZxAnJOSdXXDa9Gh4wg88n4VPL2lMU=;
        b=foHM+q6EnjilK0p3mOSRJDcm2zQE3Vk05lsZFCsUEz/6Vm9jUiub9mskjXPg+Pn8K9
         Oj/xVIbOZqUWJ6sHHdNvtrYl0DomsC8bX5POZTqrtPpTQJd1MxTApxQHQOL0VIIbj0D9
         n9SfF+VNEZj7Vc43xFg9T/KIzMm4xDCtyCCX5MCmqAzGLmZpghrtn9e7/UHgNBDh7HJG
         FqQUBPRKh716mWhD1vlTz1z0q7p7Yld8buGQhGZoPchAzVJIbglgOfvBqZ4AadrEP7OG
         VVR/IdB7flHEbpIq2LM0vc22TriqEcpctK1/BACNom+DL8SVUVTrHt/N53BEIRPhnAJ4
         ftyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2m/uNsCm/OsAUZxAnJOSdXXDa9Gh4wg88n4VPL2lMU=;
        b=eUlMMBi6C/AM/zfLyI2KQoxkFyk+t/EuZIzWf8sFCuazSXof9/uieN2JbS2MUt4Z+6
         q981CSWvrohHIRZ7PWEaZ7JYGvOU9F0RVoGzdB/+NvkMZjPPv7grLXL/JWnmY4B7ZF9C
         AI+brA7VYQhO4FmV86HOehaqNTeDbyBxIRSzd/KhHATR2BtnKN0pD+hPWt7y/8nCXDKK
         HJhMVIawuFLiOiEm6xLiJ0f2OikhtL8dH4VSLsGG1lptM75sGtwF+1fFoBQTzMe7IK6/
         lBWf55BFxbBJ2Qcc6uzhMJ4HXsx2zB2PU/T4j4k5/ALEHcsQ24/yy5YbY0V3fvYwxtdK
         V6Uw==
X-Gm-Message-State: AFqh2kp9SeIFPTw+Iu8E1NlCOtxxjZe1DtWLJS4ovpf3zNKUImeGDn2h
        haomoQjs8NJjIH7Z0S9L/oHbchVmZvf6DwuMG6g=
X-Google-Smtp-Source: AMrXdXtn18sv3uo2tsbpouxIINOrf2DjE3cjtX2PjP1sJLxOrv4duMocnY6sg4x88ugCm/yarso+YHlwkZjvBebTM6A=
X-Received: by 2002:a17:902:c255:b0:192:9a42:b839 with SMTP id
 21-20020a170902c25500b001929a42b839mr1753186plg.160.1672838115172; Wed, 04
 Jan 2023 05:15:15 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6a10:cd05:b0:36a:799e:f866 with HTTP; Wed, 4 Jan 2023
 05:15:14 -0800 (PST)
Reply-To: Gregdenzell9@gmail.com
From:   Greg Denzell <magdesenrbb1@gmail.com>
Date:   Wed, 4 Jan 2023 13:15:14 +0000
Message-ID: <CACDBXyJKRVfSxa26K3HtP3HUZCz-t9faN0D3PcpPx8VtnF6xng@mail.gmail.com>
Subject: Seasons Greetings!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Seasons Greetings!

This will remind you again that I have not yet received your reply to
my last message to you.
