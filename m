Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE60077698B
	for <lists+selinux@lfdr.de>; Wed,  9 Aug 2023 22:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233163AbjHIULD (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 9 Aug 2023 16:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232716AbjHIULD (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 9 Aug 2023 16:11:03 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F08110CF
        for <selinux@vger.kernel.org>; Wed,  9 Aug 2023 13:11:01 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-76d1dc1ebfdso65212885a.0
        for <selinux@vger.kernel.org>; Wed, 09 Aug 2023 13:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691611860; x=1692216660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xxrfX14FSHAk75AvYGK9tg4QTun2pyD41JeGpqOMjc=;
        b=kwrgtffyGnaAOH3k3T2DOHdi3GjmQSc7vA0FZT4MGxosBfUj6P3YasDTzWwis2UhWM
         ykwQbFAHnzQZiM2sSD7DEyAN7kU0USK2WuQX+ZiptFrMj4fAMvCiEf+ub9P/n2xFHPeF
         +xbvjns5OxcD0HoPeGG92qct35Mtcj+IaObq9Nx6zhrn4aapyQiomsAA/7jNSTMm0w6w
         Vhf2Jt8xEQ2UN0TF9rAD5WgAJ0oBvISlwuvCh0VhYzqmDhxyIuN7ZU6hTwSp5pq/txf+
         a7rrWy89Fq619re7iamnNqKmsR2AzjJrSMnsFfRnhgxO9Z9hQayadLqmBocePCOIKebM
         mvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691611860; x=1692216660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xxrfX14FSHAk75AvYGK9tg4QTun2pyD41JeGpqOMjc=;
        b=RkFiUFCuaUmM3djbVLdVPMigA3aYBnqw6tqXsJPesjTirqwuLb/Sa6ODWMalpf8NPh
         bTFNsJDwUXqhF32yLbiTZfnXznV1sLO8Y7/o4f0Rk/hxDbYXyaxNXorqkKTemnsTW5Yu
         m0eDmVJwid2pDtFnZOpMs9hXkJ2aXdJlh0atmeslya8qwL3Y4z051RVOUW0CfcrENu8c
         YKzCeXoIyG5O3xru+5ShFLRuGabZcfRE/bpncB1g3dvyRlXpIzCtfjAS1mqi8EwlpG9p
         ETEzqbV0BWdzRn1FcXrrc5FNhWoa9hYvAJMmDzxOgO9v5aj/qXptgOvc5K01pRGK6g7C
         yCuA==
X-Gm-Message-State: AOJu0YyTC2AhKNcbXQWHl+jmmpFj/1Huw8yPMFnwbuEv3apIKkMTQ0vB
        BKZQPbAoT4sGMVt20jKg97XPCJgID44=
X-Google-Smtp-Source: AGHT+IEZx+sfpQbJaYaknWQUFkwzE+NA9R9IwWmjTjBCnoFU3WemzuRjR66+GIktNsZB/FRMHf6Bqg==
X-Received: by 2002:a05:620a:4412:b0:767:dd1e:967b with SMTP id v18-20020a05620a441200b00767dd1e967bmr542285qkp.39.1691611859503;
        Wed, 09 Aug 2023 13:10:59 -0700 (PDT)
Received: from electric.. (c-73-172-54-2.hsd1.md.comcast.net. [73.172.54.2])
        by smtp.gmail.com with ESMTPSA id w11-20020ae9e50b000000b00767d572d651sm4220210qkf.87.2023.08.09.13.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 13:10:59 -0700 (PDT)
From:   James Carter <jwcart2@gmail.com>
To:     selinux@vger.kernel.org
Cc:     plautrba@redhat.com, James Carter <jwcart2@gmail.com>
Subject: [PATCH 04/13 v2] libselinux: Remove the Russian translations
Date:   Wed,  9 Aug 2023 16:10:40 -0400
Message-ID: <20230809201051.108944-5-jwcart2@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809201051.108944-1-jwcart2@gmail.com>
References: <20230809201051.108944-1-jwcart2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

The Russian translations have not been maintained and are out of
date, so remove them. This removes the man8 translations and the
ru directory.

Suggested-by: Petr Lautrbach <plautrba@redhat.com>
Signed-off-by: James Carter <jwcart2@gmail.com>
---
 libselinux/man/ru/man8/avcstat.8            |  35 -------
 libselinux/man/ru/man8/booleans.8           |  46 ---------
 libselinux/man/ru/man8/getenforce.8         |  19 ----
 libselinux/man/ru/man8/getsebool.8          |  40 --------
 libselinux/man/ru/man8/matchpathcon.8       |  62 ------------
 libselinux/man/ru/man8/sefcontext_compile.8 |  70 -------------
 libselinux/man/ru/man8/selinux.8            | 106 --------------------
 libselinux/man/ru/man8/selinuxenabled.8     |  21 ----
 libselinux/man/ru/man8/selinuxexeccon.8     |  28 ------
 libselinux/man/ru/man8/setenforce.8         |  32 ------
 libselinux/man/ru/man8/togglesebool.8       |  23 -----
 11 files changed, 482 deletions(-)
 delete mode 100644 libselinux/man/ru/man8/avcstat.8
 delete mode 100644 libselinux/man/ru/man8/booleans.8
 delete mode 100644 libselinux/man/ru/man8/getenforce.8
 delete mode 100644 libselinux/man/ru/man8/getsebool.8
 delete mode 100644 libselinux/man/ru/man8/matchpathcon.8
 delete mode 100644 libselinux/man/ru/man8/sefcontext_compile.8
 delete mode 100644 libselinux/man/ru/man8/selinux.8
 delete mode 100644 libselinux/man/ru/man8/selinuxenabled.8
 delete mode 100644 libselinux/man/ru/man8/selinuxexeccon.8
 delete mode 100644 libselinux/man/ru/man8/setenforce.8
 delete mode 100644 libselinux/man/ru/man8/togglesebool.8

diff --git a/libselinux/man/ru/man8/avcstat.8 b/libselinux/man/ru/man8/avcstat.8
deleted file mode 100644
index b6d84964..00000000
--- a/libselinux/man/ru/man8/avcstat.8
+++ /dev/null
@@ -1,35 +0,0 @@
-.TH "avcstat" "8" "18 ноября 2004" "dwalsh@redhat.com" "Документация по командной строке SELinux"
-.SH "ИМЯ"
-avcstat \- показать статистику AVC (Access Vector Cache, кэш вектора доступа) SELinux
-.
-.SH "ОБЗОР"
-.B avcstat
-.RB [ \-c ]
-.RB [ \-f
-.IR status_file ]
-.RI [ interval ]
-.
-.SH "ОПИСАНИЕ"
-Показать статистику AVC SELinux.  Если указан параметр
-.I interval
-, программа будет выполняться циклами, показывая обновлённую статистику каждые
-.I interval
-секунд.
-По умолчанию показываются относительные значения. 
-.
-.SH ПАРАМЕТРЫ
-.TP
-.B \-c
-Показать совокупные значения.
-.TP
-.B \-f
-Указывает расположение файла статистики AVC, по умолчанию это
-.IR /sys/fs/selinux/avc/cache_stats .
-.
-.SH "СМОТРИТЕ ТАКЖЕ"
-.BR selinux (8)
-.
-.SH АВТОРЫ
-Эта страница руководства была написана Dan Walsh <dwalsh@redhat.com>.
-Программа была написана James Morris <jmorris@redhat.com>.
-Перевод на русский язык выполнила Герасименко Олеся <gammaray@basealt.ru>.
diff --git a/libselinux/man/ru/man8/booleans.8 b/libselinux/man/ru/man8/booleans.8
deleted file mode 100644
index 20e5b00d..00000000
--- a/libselinux/man/ru/man8/booleans.8
+++ /dev/null
@@ -1,46 +0,0 @@
-.TH "booleans" "8" "11 августа 2004" "dwalsh@redhat.com" "Документация по командной строке SELinux"
-.SH "ИМЯ"
-booleans \- логические переключатели политики позволяют настраивать политику SELinux в среде выполнения
-.
-.SH "ОПИСАНИЕ"
-Эта страница руководства описывает логические переключатели политики SELinux.
-.BR
-Политика SELinux может включать условные правила, которое включены или отключены в зависимости от текущих значений набора логических переключателей политики.
-Эти логические переключатели политики позволяют изменять политику безопасности в среде выполнения без загрузки новой политики.  
-
-Например, логический переключатель httpd_enable_cgi (если он включён) позволяет управляющей программе httpd запускать сценарии cgi. Если администратору требуется запретить исполнение сценариев cgi, можно просто установить соответствующее значение этого переключателя.  
-
-Политика определяет значение по умолчанию для каждого логического переключателя, обычно это false.
-Эти значения по умолчанию можно переопределить через локальные параметры, созданные с помощью утилиты
-.BR setsebool (8)
-, используя
-.B \-P
-для сохранения параметра после перезагрузок.  Средство
-.B system\-config\-securitylevel
-предоставляет графический интерфейс для изменения параметров. Программа
-.BR load_policy (8)
-по умолчанию сохранит текущие параметры логических переключателей после перезагрузки политики по умолчанию. При необходимости также можно сбросить значения логических переключателей на их значения по умолчанию при загрузке, для этого используется параметр 
-.B \-b.
-
-Для получения и вывода списка логических значений служит утилита
-.BR getsebool (8)
-с параметром
-.B \-a.
-
-Логические значения также можно изменить во время выполнения с помощью утилиты
-.BR setsebool (8)
-или утилиты
-.BR togglesebool (8).
-По умолчанию эти утилиты изменяют только текущее логическое значение и не влияют на постоянные параметры, если в setsebool не используется параметр
-.B \-P.
-.
-.SH "СМОТРИТЕ ТАКЖЕ"
-.BR getsebool (8),
-.BR setsebool (8),
-.BR selinux (8),
-.BR togglesebool (8)
-.
-.SH АВТОРЫ
-Эта страница руководства была написана Dan Walsh <dwalsh@redhat.com>.
-Поддержка условной политики SELinux была разработана Tresys Technology.
-Перевод на русский язык выполнила Герасименко Олеся <gammaray@basealt.ru>.
diff --git a/libselinux/man/ru/man8/getenforce.8 b/libselinux/man/ru/man8/getenforce.8
deleted file mode 100644
index 13589e19..00000000
--- a/libselinux/man/ru/man8/getenforce.8
+++ /dev/null
@@ -1,19 +0,0 @@
-.TH "getenforce" "8" "7 апреля 2004" "dwalsh@redhat.com" "Документация по командной строке SELinux"
-.SH "ИМЯ"
-getenforce \- получить текущий режим SELinux
-.
-.SH "ОБЗОР"
-.B getenforce
-.
-.SH "ОПИСАНИЕ"
-.B getenforce
-сообщает, в каком режиме работает SELinux (принудительный, разрешительный, отключённый).
-.
-.SH "СМОТРИТЕ ТАКЖЕ"
-.BR selinux (8),
-.BR setenforce (8),
-.BR selinuxenabled (8)
-.
-.SH АВТОРЫ
-Dan Walsh, <dwalsh@redhat.com>.
-Перевод на русский язык выполнила Герасименко Олеся <gammaray@basealt.ru>.
diff --git a/libselinux/man/ru/man8/getsebool.8 b/libselinux/man/ru/man8/getsebool.8
deleted file mode 100644
index 04d9820e..00000000
--- a/libselinux/man/ru/man8/getsebool.8
+++ /dev/null
@@ -1,40 +0,0 @@
-.TH "getsebool" "8" "11 августа 2004" "dwalsh@redhat.com" "Документация по командной строке SELinux"
-.SH "ИМЯ"
-getsebool \- получить логические значения SELinux
-.
-.SH "ОБЗОР"
-.B getsebool
-.RB [ \-a ]
-.RI [ boolean ]
-.
-.SH "ОПИСАНИЕ"
-.B getsebool 
-сообщает, где включён или отключён конкретный логический переключатель
-или все логические переключатели SELinux.
-В некоторых ситуациях для логического переключателя может существовать
-ожидающее изменение (переход из одного состояние в другое) - getsebool
-сообщит об этом.
-Ожидающее значение - то значение, которое будет применено при
-следующей фиксации логического переключателя.
-
-Установка значений логических переключателей выполняется в два этапа;
-сначала изменяется ожидающее значение, а затем логические переключатели
-фиксируются, в результате чего их активные значения заменяются 
-ожидающими значениями. Это позволяет изменить группу логических
-переключателей за одну транзацию, задав все необходимые ожидающие
-значения и затем одновременно зафиксировав их.
-.
-.SH ПАРАМЕТРЫ
-.TP
-.B \-a
-Показать все логические переключатели SELinux.
-.
-.SH "СМОТРИТЕ ТАКЖЕ"
-.BR selinux (8),
-.BR setsebool (8),
-.BR booleans (8)
-.
-.SH АВТОРЫ
-Эта страница руководства была написана Dan Walsh <dwalsh@redhat.com>.
-Программа была написана Tresys Technology.
-Перевод на русский язык выполнила Герасименко Олеся <gammaray@basealt.ru>.
diff --git a/libselinux/man/ru/man8/matchpathcon.8 b/libselinux/man/ru/man8/matchpathcon.8
deleted file mode 100644
index 5bd586d4..00000000
--- a/libselinux/man/ru/man8/matchpathcon.8
+++ /dev/null
@@ -1,62 +0,0 @@
-.TH "matchpathcon" "8" "21 апреля 2005" "dwalsh@redhat.com" "Документация по командной строке SELinux"
-.SH "ИМЯ"
-matchpathcon \- получить текущий контекст безопасности SELinux для указанного пути из конфигурации контекстов файлов
-.
-.SH "ОБЗОР"
-.B matchpathcon
-.RB [ \-V ]
-.RB [ \-N ]
-.RB [ \-n ]
-.RB [ \-m
-.IR type ]
-.RB [ \-f
-.IR file_contexts_file ]
-.RB [ \-p
-.IR prefix ]
-.RB [ \-P
-.IR policy_root_path ]
-.I filepath...
-.
-.SH "ОПИСАНИЕ"
-.BR matchpathcon
-опрашивает системную политику и выводит контекст безопасности по умолчанию, связанный с путём к файлу.
-
-.B Примечание:
-Одинаковые пути могут иметь разные контексты безопасности в зависимости от типа файла (обычный файл, каталог, файл связи, файл знаков ...).
-
-.B matchpathcon 
-также будет учитывать тип файла при определении контекста безопасности по умолчанию (если файл существует). Если файл не существует, сопоставление по типу файла не будет выполнено.
-.
-.SH ПАРАМЕТРЫ
-.TP
-.BI \-m " type"
-Принудительно указать тип файла для поиска.
-Действительные типы:
-.BR file ", " dir ", "pipe ", " chr_file ", " blk_file ", "
-.BR lnk_file ", " sock_file .
-.TP
-.B \-n
-Не показывать путь.
-.TP
-.B \-N
-Не использовать преобразования.
-.TP
-.BI \-f " file_context_file"
-Использовать альтернативный файл file_context
-.TP
-.BI \-p " prefix"
-Использовать префикс для ускорения преобразований
-.TP
-.BI \-P " policy_root_path"
-Использовать альтернативный корневой путь к политике
-.TP
-.B \-V
-Проверить контекст файла на диске на соответствие параметрам по умолчанию
-.
-.SH "СМОТРИТЕ ТАКЖЕ"
-.BR selinux "(8), "
-.BR matchpathcon (3)
-.
-.SH АВТОРЫ
-Эта страница руководства была написана Dan Walsh <dwalsh@redhat.com>.
-Перевод на русский язык выполнила Герасименко Олеся <gammaray@basealt.ru>.
diff --git a/libselinux/man/ru/man8/sefcontext_compile.8 b/libselinux/man/ru/man8/sefcontext_compile.8
deleted file mode 100644
index 3a6b832a..00000000
--- a/libselinux/man/ru/man8/sefcontext_compile.8
+++ /dev/null
@@ -1,70 +0,0 @@
-.TH "sefcontext_compile" "8" "12 августа 2015" "dwalsh@redhat.com" "Документация по командной строке SELinux"
-.SH "ИМЯ"
-sefcontext_compile \- скомпилировать файлы регулярных выражений контекстов файлов
-.
-.SH "ОБЗОР"
-.B sefcontext_compile
-.RB [ \-o
-.IR outputfile ]
-.RB [ \-p
-.IR policyfile ]
-.I inputfile
-.
-.SH "ОПИСАНИЕ"
-.B sefcontext_compile
-используется для компиляции регулярных выражений контекстов файлов в формат
-.BR pcre (3).
-.sp
-Скомпилированный файл используется функциями проставления меток файлов libselinux.
-.sp
-По умолчанию
-.B sefcontext_compile
-записывает скомпилированный файл pcre с суффиксом
-.B .bin
-в конце (например, \fIinputfile\fB.bin\fR).
-.SH ПАРАМЕТРЫ
-.TP
-.B \-o
-Указать
-.I outputfile
-- должно быть полным именем файла, так как суффикс
-.B .bin
-не добавляется автоматически.
-.TP
-.B \-p
-Указать двоичный
-.I policyfile
-для использования при проверке записей контекста в
-.I inputfile
-.br
-Если найден недействительный контекст, запись файла в формате pcre не будет выполнена и появится сообщение об ошибке.
-
-.SH "ВОЗВРАЩАЕМОЕ ЗНАЧЕНИЕ"
-При ошибке возвращается -1. При успешном завершении возвращается 0.
-
-.SH "ПРИМЕРЫ"
-.B Пример 1:
-.br
-sefcontext_compile /etc/selinux/targeted/contexts/files/file_contexts
-.sp
-В результате создаётся следующий файл:
-.RS
-/etc/selinux/targeted/contexts/files/file_contexts.bin
-.RE
-.sp
-.B Пример 2:
-.br
-sefcontext_compile -o new_fc.bin /etc/selinux/targeted/contexts/files/file_contexts
-.sp
-В результате в текущем рабочем каталоге создаётся следующий файл:
-.RS
-new_fc.bin
-.RE
-.
-.SH "СМОТРИТЕ ТАКЖЕ"
-.BR selinux (8),
-.BR semanage (8)
-.
-.SH АВТОРЫ
-Dan Walsh, <dwalsh@redhat.com>.
-Перевод на русский язык выполнила Герасименко Олеся <gammaray@basealt.ru>.
diff --git a/libselinux/man/ru/man8/selinux.8 b/libselinux/man/ru/man8/selinux.8
deleted file mode 100644
index 4ab64276..00000000
--- a/libselinux/man/ru/man8/selinux.8
+++ /dev/null
@@ -1,106 +0,0 @@
-.TH  "selinux"  "8"  "29 апреля 2005" "dwalsh@redhat.com" "Документация по командной строке SELinux"
-.SH "ИМЯ"
-SELinux \- Linux с улучшенной безопасностью от (SELinux)
-.
-.SH "ОПИСАНИЕ"
-Linux с улучшенной безопасностью от - это реализация гибкой архитектуры мандатного
-управления доступом в операционной системе Linux. Архитектура SELinux предоставляет
-общую поддержку использования различных видов политик мандатного управления доступом,
-включая основанные на концепциях Type Enforcement® (принудительное присвоение типов),
-Role-Based Access Control (управление доступом на основе ролей) и Multi-Level Security
-(многоуровневая безопасность). Дополнительная информация и техническая документация по
-SELinux доступна по адресу https://github.com/SELinuxProject.
-
-Файл конфигурации
-.I /etc/selinux/config
-позволяет управлять включением и отключением SELinux и, если SELinux включён,
-устанавливать режим его работы - разрешительный или принудительный. Переменной
-.B SELINUX
-можно задать значение отключённой, разрешительной или принудительной, чтобы выбрать
-один из этих вариантов. Если выбрать отключение режима, код ядра и приложения SELinux
-будет полностью отключён, система будет работать без какой-либо защиты SELinux.
-При установке разрешительного режима код SELinux включён, но не выполняет отказы в
-доступе, а только журналирует те действия, которые были бы запрещены при
-принудительном режиме. При установке принудительного режима код SELinux включён,
-выполняет отказы в доступе и журналирует соответствующие попытки доступа. Набор
-отказов в доступе в разрешительном режиме может отличаться от этого набора в
-принудительном режиме как по причине того, что принудительный режим предотвращает
-дальнейшее выполнение операции после первого отказа, так и из-за того, что после
-получения отказа в доступе часть кода приложения вернётся к работе в менее
-привилегированном режиме.
-
-Файл конфигурации
-.I /etc/selinux/config
-также управляет тем, какая политика активна в системе. SELinux позволяет установить
-в системе несколько политик, но одновременно можно использовать только одну из них.
-В настоящее время имеется несколько видов политики SELinux, например, целевая политика
-(targeted), политика многоуровневой безопасности (mls). Целевая политика позволяет
-большинству процессов пользователя выполняться без ограничений, помещая в отдельные
-домены безопасности, ограниченные политикой, только отдельные службы. Например, процессы
-пользователя выполняются в никак не ограниченном домене, в то время как именованная
-управляющая программа или управляющая программа apache будет выполняться в отдельном
-специально настроенном домене. Если используется политика MLS (Multi-Level Security),
-все процессы будут разделены по детально настроенным доменам безопасности и ограничены
-политикой. MLS также поддерживает модель Белла — Лападулы, в которой процессы
-ограничиваются не только по типу, но и по уровню данных.
-
-Чтобы определить, какая политика будет выполняться, следует установить переменную среды
-.B SELINUXTYPE
-в
-.IR /etc/selinux/config .
-Чтобы применить к системе изменение типа политики, необходимо перезагрузить систему и,
-возможно, повторно проставить метки. В каталогах
-.I /etc/selinux/{SELINUXTYPE}/
-необходимо установить для каждой такой политики соответствующую конфигурацию.
-
-Дальнейшую настройку отдельной политики SELinux можно выполнить с помощью набора настраиваемых 
-при компиляции параметров и набора логических переключателей среды выполнения политики.
-.B \%system\-config\-selinux
-позволяет настроить эти логические переключатели и настраиваемые параметры.
-
-Многие домены, которые защищены SELinux, также содержат man-страницы SELinux с информацией
-о настройке соответствующей политики.  
-.
-.SH "ПРОСТАВЛЕНИЕ МЕТОК ДЛЯ ФАЙЛОВ"
-Всем файлам, каталогам, устройствам ... назначены контексты безопасности/метки. Эти контексты хранятся в расширенных атрибутах файловой системы.
-Проблемы с SELinux часто возникают из-за неправильного проставления меток в файловой системе. Это может быть вызвано загрузкой компьютера с ядром, отличным от SELinux. Появление сообщения об ошибке, содержащего file_t, обычно означает серьёзную проблему с проставлением меток в файловой системе.  
-
-Лучшим способом повторного проставления меток в файловой системе является создание файла флага
-.I /.autorelabel
-и последующая перезагрузка.
-.BR system\-config\-selinux
-также имеет эту функциональность. Кроме того, для повторного проставления меток для файлов можно использовать команды
-.BR restorecon / fixfiles.
-.
-.SH ФАЙЛЫ
-.I /etc/selinux/config
-.
-.SH "СМОТРИТЕ ТАКЖЕ"
-.ad l
-.nh
-.BR booleans (8),
-.BR setsebool (8),
-.BR sepolicy (8),
-.BR system-config-selinux (8),
-.BR togglesebool (8),
-.BR restorecon (8),
-.BR fixfiles (8),
-.BR setfiles (8),
-.BR semanage (8),
-.BR sepolicy (8)
-
-Для каждой ограниченной службы в системе имеется man-cтраница следующего формата:
-.br
-
-.BR <servicename>_selinux (8)
-
-Например, для службы httpd имеется страница
-.BR httpd_selinux (8).
-
-.B man -k selinux
-
-Выведет список всех man-страниц SELinux.
-
-.SH АВТОРЫ
-Эта страница руководства была написана Dan Walsh <dwalsh@redhat.com>.
-Перевод на русский язык выполнила Герасименко Олеся <gammaray@basealt.ru>.
diff --git a/libselinux/man/ru/man8/selinuxenabled.8 b/libselinux/man/ru/man8/selinuxenabled.8
deleted file mode 100644
index 9c4af18b..00000000
--- a/libselinux/man/ru/man8/selinuxenabled.8
+++ /dev/null
@@ -1,21 +0,0 @@
-.TH "selinuxenabled" "8" "7 апреля 2004" "dwalsh@redhat.com" "Документация по командной строке SELinux"
-.SH "ИМЯ"
-selinuxenabled \- утилита для использования внутри сценариев оболочки, которая позволяет определить, включён ли selinux
-.
-.SH "ОБЗОР"
-.B selinuxenabled
-.
-.SH "ОПИСАНИЕ"
-Показывает, включён или отключён SELinux.
-.
-.SH "СОСТОЯНИЕ ВЫХОДА"
-Выход с состоянием 0, если SELinux включён, и 1, если он отключён.
-.
-.SH "СМОТРИТЕ ТАКЖЕ"
-.BR selinux (8),
-.BR setenforce (8),
-.BR getenforce (8)
-.
-.SH АВТОРЫ
-Dan Walsh, <dwalsh@redhat.com>.
-Перевод на русский язык выполнила Герасименко Олеся <gammaray@basealt.ru>.
diff --git a/libselinux/man/ru/man8/selinuxexeccon.8 b/libselinux/man/ru/man8/selinuxexeccon.8
deleted file mode 100644
index 3ddfe97b..00000000
--- a/libselinux/man/ru/man8/selinuxexeccon.8
+++ /dev/null
@@ -1,28 +0,0 @@
-.TH "selinuxexeccon" "8" "14 мая 2011" "dwalsh@redhat.com" "Документация по командной строке SELinux"
-.SH "ИМЯ"
-selinuxexeccon \- сообщить контекст SELinux, который используется для этого исполняемого файла
-.
-.SH "ОБЗОР"
-.B selinuxexeccon
-.I command
-.RI [ fromcon ]
-.
-.SH "ОПИСАНИЕ"
-.B selinuxexeccon
-сообщает контекст SELinux для указанной команды из указанного контекста или текущего контекста.
-.
-.SH ПРИМЕР
-.nf
-# selinuxexeccon /usr/bin/passwd 
-staff_u:staff_r:passwd_t:s0-s0:c0.c1023
-
-# selinuxexeccon /usr/sbin/sendmail system_u:system_r:httpd_t:s0
-system_u:system_r:system_mail_t:s0
-.fi
-.
-.SH "СМОТРИТЕ ТАКЖЕ"
-.BR secon (8)
-.
-.SH АВТОРЫ
-Эта страница руководства была написана Dan Walsh <dwalsh@redhat.com>.
-Перевод на русский язык выполнила Герасименко Олеся <gammaray@basealt.ru>.
diff --git a/libselinux/man/ru/man8/setenforce.8 b/libselinux/man/ru/man8/setenforce.8
deleted file mode 100644
index e0daad9a..00000000
--- a/libselinux/man/ru/man8/setenforce.8
+++ /dev/null
@@ -1,32 +0,0 @@
-.TH "setenforce" "8" "7 апреля 2004" "dwalsh@redhat.com" "Документация по командной строке SELinux"
-.SH "ИМЯ"
-setenforce \- изменить режим, в котором выполняется SELinux
-.
-.SH "ОБЗОР"
-.B setenforce
-.RB [ Enforcing | Permissive | 1 | 0 ]
-.
-.SH "ОПИСАНИЕ"
-Используйте
-.B Enforcing
-или
-.B 1
-для установки SELinux в принудительный режим.
-.br
-Используйте
-.B Permissive
-или
-.B 0
-для установки SELinux в разрешительный режим.
-
-Если SELinux отключён и требуется его включить (или если SELinux включён и требуется его отключить), обратитесь к странице руководства 
-.BR selinux (8).
-.
-.SH "СМОТРИТЕ ТАКЖЕ"
-.BR selinux (8),
-.BR getenforce (8),
-.BR selinuxenabled (8)
-.
-.SH АВТОРЫ
-Dan Walsh, <dwalsh@redhat.com>.
-Перевод на русский язык выполнила Герасименко Олеся <gammaray@basealt.ru>.
diff --git a/libselinux/man/ru/man8/togglesebool.8 b/libselinux/man/ru/man8/togglesebool.8
deleted file mode 100644
index 1da9bcc4..00000000
--- a/libselinux/man/ru/man8/togglesebool.8
+++ /dev/null
@@ -1,23 +0,0 @@
-.TH "togglesebool" "8" "26 октября 2004" "sgrubb@redhat.com" "Документация по командной строке SELinux"
-.SH "ИМЯ"
-togglesebool \- переключить текущее значение логического переключателя SELinux
-.
-.SH "ОБЗОР"
-.B togglesebool
-.I boolean...
-.
-.SH "ОПИСАНИЕ"
-.B togglesebool
-переключает текущее значение списка логических переключателей. Если текущее значение 1,
-то оно будет заменено на 0, и наоборот. Меняются только "находящиеся в памяти" значения;
-параметры загрузки остаются без изменений. 
-.
-.SH "СМОТРИТЕ ТАКЖЕ"
-.BR selinux (8),
-.BR booleans (8),
-.BR getsebool (8),
-.BR setsebool (8)
-.
-.SH АВТОРЫ
-Эта страница руководства была написана Steve Grubb <sgrubb@redhat.com>.
-Перевод на русский язык выполнила Герасименко Олеся <gammaray@basealt.ru>.
-- 
2.41.0

