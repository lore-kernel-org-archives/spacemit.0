Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.22.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908754;
	b=S7vmM2CDz5KzbT7qR7zCQQPt37Qm1HSeK9wOKNUt/aUmHHy2WHFoLa+OVVlBjZs6ZHTd
	 acNhAw93k4jqPFDfWsGmpiXBuG2vwcBBqzZK6hRE2mDH5keH/bTdh6brH3NoEk9Uc6Cpe
	 naAGZWrsYSDBDcVQmlQIpyKJPL/T7o92TZh67C9fynerNUx675A/4cSvWbqjTOhXZh6UO
	 6briHfibRGXir6v8nZ16RIF5+zzzPNeBJnFxmm/DUzisyJyoFaMmLzxUP9+IGxW1Bax0L
	 STlRBtlQkXpvoyrHQlzSO5PPqKCUgb5o7QvO/3wyhzgpqK5OtDIKTfbB7YM31ysMEvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908754;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=ZvPjwIuTAnlYX80kDgK6OqiQQQr9D8Xp6DoCGU/LXLc=;
	b=JgS0zajoDfiSY84sowrdYHfubQDS0fACNyYIeWh4h1BOpWlTOOIC+if3Yxuf7aEdMNAD
	 foneZ5cYr+hNgULNUpUUrCSePLsZcvNLyPxYWwWJKrfzMrIqlYWIRR//fr8dsNbwvEKth
	 3b/qRY+ze4nduYMz6xa1QXVzziFFs/ogD4kde52tMM2sXsYK6Y+CY7UAFXw8HxCaMc9pT
	 01xdDjAAzIwNwmttvrIgohJIXfL8GLDclweM+Wjb2r9ZbPeMI8PU7imNKSkfIDI7Xuu9f
	 I6AEIiflET9IB9IVsvEe+MnOkf/gNEXbmSVIrBhWvvLTW1j0bhpDYuZ/2NboPj8xR5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Juijl62d;
	arc=none smtp.remote-ip=54.207.22.56
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8B0606A32A
	for <spacemit@lists.linux.dev>; Tue, 17 Nov 2026 09:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA8B0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Juijl62d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794908715;
	bh=ZvPjwIuTAnlYX80kDgK6OqiQQQr9D8Xp6DoCGU/LXLc=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=Juijl62daA2fLjQ8TKb/xYn0yQzTYr/q0H2gXOSxcWVHTaZpgYZwZWBuWEYqrxfok
	 ZKJ6N8qYqppIenvKBf9r4O8lwRIus/Rtkhy/OMkqi4WvphsECqFW6b/76FMHiAHLLo
	 MAKA7PpKlNyePKC/HcVg6xj43MBYGk7WJ1J8qUlw=
X-QQ-mid: esmtpsz11t1794908714t27c88566
X-QQ-Originating-IP: hY6HrPs5VQA5PN3p2ipRXrGUKx3WM2dlkLwykvxKZZo=
Received: from = ( [183.48.247.191])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 17:45:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7238423298183488495
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v2 0/5] Add SpacemiT K1/K3 SoC timer support
Date: Tue, 17 Nov 2026 09:45:08 +0000
Message-Id: <20261117-spacemit-soc-timer-v2-0-9264d0ea7755@linux.spacemit.com>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw6CMBBFf4XM2pK2mIqu/A/DAtpBxgglnUIwh
 H+XR9y5PMm598zAGAgZbskMAUdi8t0K+pSAbcruiYLcyqClNkqqq+C+tNhSFOytiNRiELZ0dSb
 z3OncwDrsA9Y07aeP4mAeqhfauD1tRkMcffjs1VFt3hFQMvsXGJWQIjMXrc9aucrg/U3dMKU/N
 bW+hWJZli/winKJzwAAAA==
X-Change-ID: 20261019-spacemit-soc-timer-cadf3088d286
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=KdrZK8s43rp5HCV+9mBsmR/lHxRrd63zdxl5ZHQcqpg=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFl/lNQEdP/xRt0s3qWYNuuqLdfr8DWsqq1CPjuuvT4r6
 v1kMmNTRykLgxgXg6yYIkv3A55tBT5RtgUChb4wc1iZQIYwcHEKwET6FRgZPiUEau/SrOk/fWF1
 7HPZY4bT3k413qzfdHyz/LTmF9NiUhj+14Wpd0dPY5zHMmvF2vmrXnpP79gYx7F87btdj37q6N7
 aywQA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Nwz8Cs33/Lpr1qnF44r9DlQT1zL5njj5OWAlpL82RFEDZahQn9SD+mnE
	Mtp4Vo6t6EBLxFyGp4bfQW1l5Yp54KrqX8cOhuHp6ky3trspCttQYt7d5d75VOaphtQXJTv
	D5hsYXqRAEvQrA+oaJrWD8F8KlnqI43sLp7FKR5MBJ3PGesex6vSuPAOd1uAIgV5Gtypz5x
	3aeygNrVhjpqC1TPMr508k5uoKKVMy+1bd/Wyck1ZRyfUatcWs7Q567Hc6LJQ5y5VgepqOU
	eXMpImNfg/uvrbtdBMcdNWUt5N5mjQ/WKk08mZjG5fFm++aINC+aVZ4rl1ux5/xARC4Jm/B
	3pekmzZIV8OGTPRXJb4NazOhO8GxxHuXvTDZwMuYEkPcBZPn9tXvRL80tAdFVUI5AF9IFJm
	F7eOwiJiO6eJcIoqgM4DZhDb6aL5m07zSsIgV3YJWegSd//AJUCM0q4L43Eoy/Ocx4NqQ1H
	+Ez9hqnsIQ3reVLiNdx/Fj3ihaO3xpCxN2zRxYUrA57bNrEG9hHr4nr2Gx/VL1/ZDWdqY5O
	6D2r1wg/GsXYS2XLKFNHx46iOH0sBDBug27FjN6K+aqdovGDx1pyPsypcMTczwrAkUg5+eS
	Jc/MbCl/7pk86ZdSrMPU2163YF1rKk/G8y74C0lYcFYOn4oQd+a6PefLVRThBsUKle2pAiO
	mGXcBFlZtKUosZ7GhTfib7T9xpcbq79rx8SVznpiVvcad1eacSThLs50d+v0oBfC5mRajrS
	BQ4z6w3JYyzvMfjcwNR+6iFBlAhiI7aJ6mLrUpV6p3E+G6OKYbQ5OzVKBNW2P9RuU2QMATt
	402Pk0jv6HhhVJTYgzO7ogCDlZm/bsKpSaXKzCccCmbvx98jQzMP5MXESxjCZrVsUDo0BF8
	P8G0BdtpsRoNBuul15wxvgXSyo/hLVlhRPB1rsWSluToFgjlhdbgCJm7/XlAYiUtQGaM4v8
	i/vTmoz6QvXFW/6x06+e+DMeFl125g8B+R+wSCHcVuWz1mH1STGfcKjXEv+dIUqw3PFlbio
	S47a+WcMnE6UUcsaLrioNVvcNfqguDquZqQthxH4qMze1PWhz2Hn4pbdeOegKrY8YN4zyu9
	qv8U1xpy8ijQ4aKrL/HlFgj/oWsuyNfyA==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

The SpacemiT K1 and K3 SoCs have APB timers that run independently of
the CPU cores. Each timer block has three 32-bit up counters, and each
counter has three match comparators and its own interrupt. A counter
can be clocked from the functional clock or from the 32.768 kHz clock,
and can run in free-running or periodic mode.

This series uses counter 0 as a oneshot clockevent. It is registered
for tick broadcast, so it can wake up CPUs whose local RISC-V timer
stops in idle.

K3 uses the same register interface as K1 and falls back to the K1
compatible. Both SoCs run the timer from a 1 MHz functional clock.

---
Changes in v2:
- Use named constants with comments for the counter sync latency and
  the minimum clock rate (Iker)
- Link to v1: https://patch.msgid.link/20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com

---
Troy Mitchell (5):
      dt-bindings: timer: Add SpacemiT K1 timer
      clocksource/drivers/spacemit: Add K1 timer support
      riscv: dts: spacemit: Add the K1 APB timer
      riscv: dts: spacemit: Add the K3 APB timer
      MAINTAINERS: Add entry for SpacemiT timer

 .../bindings/timer/spacemit,k1-timer.yaml          |  71 +++++
 MAINTAINERS                                        |   6 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  12 +
 arch/riscv/boot/dts/spacemit/k3.dtsi               |  12 +
 drivers/clocksource/Kconfig                        |  11 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/timer-spacemit.c               | 317 +++++++++++++++++++++
 7 files changed, 430 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261019-spacemit-soc-timer-cadf3088d286

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>

