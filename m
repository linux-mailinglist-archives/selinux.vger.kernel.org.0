Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDBB164C534
	for <lists+selinux@lfdr.de>; Wed, 14 Dec 2022 09:42:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbiLNImB (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 14 Dec 2022 03:42:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237761AbiLNIl7 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 14 Dec 2022 03:41:59 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 437E213F10
        for <selinux@vger.kernel.org>; Wed, 14 Dec 2022 00:41:59 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id vv4so42792440ejc.2
        for <selinux@vger.kernel.org>; Wed, 14 Dec 2022 00:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eA0h/w977llyBwMxQNx7FPnKRX9qJCv7OUJeBYB0Bb0=;
        b=Tt21HNDZq//imC5apxy/kfpqm81jYoEVZNENBOXDq5VVe81Y2nSNuVXJA8fsawdKDk
         q/gKwWwxvuFV6OjADeqwfcHVGsaHakbRcU857orBX8S5Fzz/o8bc9BdW2qFQ6aY86A6L
         tUF1aa1RjGjcCqFXq5rg4MOIgyO61W2kNNA8rzbvTG/5ihBU3j7r76j5uMmW1WmqPHUU
         APoL4U7+dEPVMWqegGoprwGCL3HY84G9nWIVejKf+7a0CaypbVXbIzRJ++IYHl3TE7hh
         0anfkzwTeu8fLSt0nygBd8vSUZSsF4QUx4xvhHXD6cV0VdoA1nEL3qmjuqSujj7iegR/
         5sOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eA0h/w977llyBwMxQNx7FPnKRX9qJCv7OUJeBYB0Bb0=;
        b=OitxBESq5MNHj2BztNOTj3NyCRpr9tehyKZCmbTcCcDgph8CxUYD338CT5cmBqghoC
         rG8cmAqkotw6I6O5p9zkAqQPtODAH4VhRNOt0npBC9yX53DnkxieIPJAEnLVI2mABNTI
         8Jr5d1FIvTe1ENfXEv4hX5DAikjIJWdiY1hCsY07jQQjkH+UPhD2QUk6JS3nCs3BbsHE
         TasXD+H9UrppBEcVUWPW7RRXNO5f8r0mBAuMWRe02nNEyJF7Ll/K14AhejzgSsCX00hJ
         g4lCZRkHwJjm4v2b05UtRmtNAq+zEc7QGKgcUJhC0BfUUZ5v8rSWEfhOOTET9pVaGxiI
         VabA==
X-Gm-Message-State: ANoB5plW1KG+EZQn7ZoUcKal/+IVnrJ2m2Nv7RWT+HBnQTmcjkPZvf/t
        qf5YIp/X2sGfLFpuXfn7sNCUWiJx4QEvWFowpvg=
X-Google-Smtp-Source: AA0mqf5oLtlq1YjQb2y11ZdmUBXy9aqZxhlXY71qhDMN40VaO2mQvmr7YCDFvjBwzO9WpNIV66sxlj/1FT/7ho7PYoA=
X-Received: by 2002:a17:907:8c08:b0:7c2:acf8:3bb8 with SMTP id
 ta8-20020a1709078c0800b007c2acf83bb8mr238289ejc.39.1671007317710; Wed, 14 Dec
 2022 00:41:57 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6f02:4084:b0:27:8b12:efa6 with HTTP; Wed, 14 Dec 2022
 00:41:57 -0800 (PST)
Reply-To: plml44@hotmail.com
From:   Philip Manul <justintentou@gmail.com>
Date:   Wed, 14 Dec 2022 00:41:57 -0800
Message-ID: <CAK9eWvjp0A08X81JOV-5tFKdJDdk3hPmRophSqd2A080sS5m5A@mail.gmail.com>
Subject: REP:
To:     in <in@proposal.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.3 required=5.0 tests=ADVANCE_FEE_3_NEW,BAYES_50,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UNCLAIMED_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:634 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [plml44[at]hotmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [justintentou[at]gmail.com]
        *  2.4 UNCLAIMED_MONEY BODY: People just leave money laying around
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  3.0 ADVANCE_FEE_3_NEW Appears to be advance fee fraud (Nigerian
        *      419)
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

--=20
Guten tag,
Mein Name ist Philip Manul. Ich bin von Beruf Rechtsanwalt. Ich habe
einen verstorbenen Kunden, der zuf=C3=A4llig denselben Namen mit Ihnen
teilt. Ich habe alle Papierdokumente in meinem Besitz. Ihr Verwandter,
mein verstorbener Kunde, hat hier in meinem Land einen nicht
beanspruchten Fonds zur=C3=BCckgelassen. Ich warte auf Ihre Antwort zum
Verfahren.
Philip Manul.

************************************************************

Good day,
My name is Philip Manul. I am a lawyer by profession. I have a
deceased client who happens to share the same surname with you. I have
all paper documents in my possession. Your relative my late client
left an unclaimed fund here in my country. I await your reply for
Procedure.
Philip Manul.
