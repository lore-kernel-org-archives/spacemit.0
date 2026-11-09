Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.199.235.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222105;
	b=SW54+B7MpZc2UyzyXFKAjG3l87QNMBa+1bxhiBLAUysqO5iHEUtuUe5wMhZwP8i9xxhP
	 CEK4Tr1vZ6DxZJ//0XH0WUrniAr/qoZJW+rQ9H09F4FkPkt1/RQpDol4hLrHwlOC1DMln
	 OLGsLTCEMwCV3KBS7T4NTBsTzebyioqDtWkQHVc5EX4bYdFcLVWQ41yKK6Di20PQ6VKyb
	 G2SOYpRaYqZ5KYSstJhRerqn3dNu1SK2YXHogcl648j5WLqTx6QNGYHfWLsXg1FbImeYV
	 Y5VWZghLwTnnyC4NO0YHJceo2tiGYXzAhERfvHff00wNXFJCcKB9V8I1B0ggRJnXVPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222105;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=S1FGdhZllrMjEm+POPzDgDYLMUR3eBpyJGxotFxGSLQ=;
	b=AyJUDOc4xOs/tDSXSNol/ybXTb97fTEl6MP6M0Rhen2WwFaZ3YxQljaaVKAS9f7XiX8L
	 H3+y2yjT3fhGYNfQ1NCc1rH5pWh92f6NwGozbuuIgqG6U0oTRRi68KViLCceXAIHLWWUL
	 66H4wjISkGpyNFogOrOINOf71lHTKJSIKWFu69e9KwcN2I9umJscneOXgA8RjC0qKLevc
	 fBU7TxkX8PigZwlb9goEnwBoqCndScuzxjbXbUizhz/ZZB/IBlfzR/tNJpTVxRFqDHldb
	 2W/oXrXmjxAJMB68NqB6mSvEqP5c3SfvV7Lbkec9Oounjmr7eWkzHvWOr/ylVIWKCsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cirad.fr;
	spf=pass smtp.mailfrom=cirad.fr;
	dkim=pass header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=FsI+0jWU;
	arc=none smtp.remote-ip=194.199.235.221
Received: from retz.cirad.fr (retz.cirad.fr [194.199.235.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5C5606A325
	for <spacemit@lists.linux.dev>; Mon,  9 Nov 2026 11:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E5C5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cirad.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirad.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=FsI+0jWU
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id D6A0B20DDBC5;
	Mon,  9 Nov 2026 12:01:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id B8A5820DDAE3;
	Mon,  9 Nov 2026 12:01:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr B8A5820DDAE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794222095;
	bh=S1FGdhZllrMjEm+POPzDgDYLMUR3eBpyJGxotFxGSLQ=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=FsI+0jWUv/4iqCVTv5yZiD8sKZSgm4Th3SmP+5UAUFz/vsUot3xkKqxr/Fdoxw4UF
	 f5fuXlDHmzcgOk2056X11ZynLgICdRTX1KgpAsoLYCdLpEjtu9SQz8bkU67dYVOUCk
	 IB6mH5XXdBC8y+4pZhnES8Wb60DdLKZ9eHifl0s1HkI99DYGzhGSCXQtDvtJYz80ZP
	 DyybB57KeR7uLBzZzizx46gP0xxkhL0ovoKQToIAYD8HS/we9xm1UxAn1P/dS+xjWt
	 gEu6GDFKLDonucVkbkoTSQQEk+OP+VSqiN74wZQCklnd7AC6HksZ40zZAIqpwnKTX3
	 cswpiuzkq5Fbg==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id HLlD2-6wYjs1; Mon,  9 Nov 2026 12:01:35 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 00C9D20DDBC5;
	Mon,  9 Nov 2026 12:01:34 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Anand Moon <linux.amoon@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
Subject: Re: [PATCH v5] riscv: disable local interrupts and stop other CPUs before reboot/shutdown
Date: Mon,  9 Nov 2026 12:00:43 +0100
Message-ID: <20261109110104.293157-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104-v7-0-rc1-rv-dis-int-before-restart-v5-1-956ec09c900d@linux.dev>
References: <20261104-v7-0-rc1-rv-dis-int-before-restart-v5-1-956ec09c900d@linux.dev>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 07:05:40AM +0000, Troy Mitchell wrote:
> Specifically, under CONFIG_PREEMPT_RCU, rcu_read_lock() does not increm=
ent
> the preempt_count. If local interrupts remain enabled, the environment
> is not guaranteed to be atomic. This can lead to a context misidentific=
ation
> within generic kernel teardown code, causing it to incorrectly enter
> non-atomic paths (such as attempting to acquire sleeping locks), which
> results in fatal "scheduling while atomic" splats or system hangs.

On Banana Pi BPI-F3 (SpacemiT K1), v7.4-rc1 defconfig, every reboot warns=
:

  WARNING: kernel/rcu/tree_plugin.h:330 at rcu_note_context_switch+0x46a/=
0x48a
  ...
  spacemit_i2c_xfer_common+0x342/0x5f6
  ...
  spacemit_p1_restart_handler+0x24/0x5a
  do_kernel_restart+0x1e/0x26

With this patch the warning is gone (2/2 clean reboots, 2/2 warnings
without it). Testing done with the help of Claude (AI assistant).

Tested-by: Fr=C3=A9d=C3=A9ric Mah=C3=A9 <frederic.mahe@cirad.fr>
